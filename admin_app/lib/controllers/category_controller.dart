import 'dart:convert';

import 'package:admin_app/global_variables.dart';
import 'package:admin_app/models/category_model.dart';
import 'package:admin_app/services/manage_http_response.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import "package:http/http.dart" as http;

class CategoryController{
  uploadCategory({required dynamic pickedImage, required dynamic bannerImage, required String name, required context}) async{
    try{
      final cloudinary = CloudinaryPublic("dcrl5demd", "intec_store");
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
      CloudinaryFile.fromBytesData(pickedImage, identifier: 'pickedImage', folder: "categoryImages"),
      );
      final image = imageResponse.secureUrl;
      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
          CloudinaryFile.fromBytesData(pickedImage, identifier: 'pickedBanner', folder: "categoryImages"),
      );
      final banner = bannerResponse.secureUrl;

      // Cargar a mondb la url de la imagen y el banner
      CategoryModel category = CategoryModel(id: "", name: name, image: image, banner: banner);
      final response = await http.post(Uri.parse('$uri/api/categories'),
          headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },body: categoryModelToJson(category));
      manageHttpReponse(response: response, context: context, onSucess: (){
        showSnackBar(context, 'Categoria creada con exito');
      });
    }
    catch(e){
      print("Error al subir la imagen");
    }
  }

  Future<List<CategoryModel>> loadCategory() async{
    try{
      final response = await http.get(
        Uri.parse('$uri/api/categories'),
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}
      );
      if(response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body);
        List<CategoryModel> categories = data.map((e) => CategoryModel.fromJson(e),).toList();
        return categories;
      }
      else{
        throw Exception("Error al cargar categorias");
      }
    }catch(e){
      print("Error al cargar categorias $e");
    }
  }
}