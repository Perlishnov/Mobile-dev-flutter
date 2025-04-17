import 'dart:convert';
import 'package:admin_app/global_variables.dart';
import 'package:admin_app/models/banner_model.dart';
import 'package:admin_app/services/manage_http_response.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import "package:http/http.dart" as http;

import '../models/banner_model.dart';

class BannerController {
  // Method to upload a banner image
  uploadBanner({required dynamic pickedImage, required context}) async {
    try {
      // Initialize Cloudinary
      final cloudinary = CloudinaryPublic("dcrl5demd", "intec_store");

      // Upload the picked image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(pickedImage, identifier: 'pickedBanner', folder: "bannerImages"),
      );

      // Get the image URL
      final image = imageResponse.secureUrl;

      // Create the BannerModel
      BannerModel banner = BannerModel(id: "", banner: image);

      // Make the POST request to your backend
      final response = await http.post(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: banner.toRawJson()
      );

      // Handle the response
      manageHttpReponse(
        response: response,
        context: context,
        onSucess: () {
          showSnackBar(context, 'Banner creado con éxito');
        },
      );
    } catch (e) {
      print("Error al subir la imagen del banner: $e");
    }
  }

  // Method to load all banners (if needed)
  Future<List<BannerModel>> loadBanners() async {
    try {
      final response = await http.get(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners = data.map((e) => BannerModel.fromJson(e)).toList();
        return banners;
      } else {
        throw Exception("Error al cargar banners");
      }
    } catch (e) {
      print("Error al cargar banners: $e");
      return [];
    }
  }
}
