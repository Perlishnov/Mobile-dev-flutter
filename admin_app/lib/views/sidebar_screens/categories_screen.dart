import 'dart:io';
import 'package:admin_app/controllers/category_controller.dart';
import 'package:admin_app/views/sidebar_screens/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';  // Para seleccionar archivos

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  static const String id = '\Categories_screen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form key para validación
  final CategoryController _categoryController = new CategoryController();
  // Reto: Al subir la categoria, el backend tiene mandar una notificacion una cadena al
  //
  dynamic _pickedImage;
  dynamic _bannerImage;
  String _categoryName ="";

  // Función para seleccionar el archivo de imagen
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,  // Filtrar solo imágenes
    );

    if (result != null) {
      setState(() {
        _pickedImage = result.files.first.bytes;
      });
    }
  }
  void _uploadCategory() async{
    if(_formKey.currentState!.validate()){
      await _categoryController.uploadCategory(pickedImage: _pickedImage, bannerImage: _bannerImage, name: _categoryName, context: context);
    }
    setState(() {
      _formKey.currentState!.reset();
      _pickedImage = null;
      _bannerImage = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,  // Asociamos la clave del formulario para validación
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: _pickedImage == null
                              ? Text('Upload image...')
                              : Image.file(
                            File(_pickedImage!),  // Mostrar la imagen seleccionada
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Text('Select Image'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      _categoryName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a category name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Category Name',
                      hintText: 'Enter category name',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Procesar el formulario si es válido
                  }
                },
                child: Text('Submit'),
              ),
            ),
            Divider(),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
