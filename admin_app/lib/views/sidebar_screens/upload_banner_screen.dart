import 'dart:io';
import 'package:admin_app/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';  // Para seleccionar archivos

class UploadBannerScreen extends StatefulWidget {
  const UploadBannerScreen({super.key});

  static const String id = '\UploadBannerScreen';

  @override
  _UploadBannerScreenState createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  final CategoryController _categoryController = new CategoryController();
  dynamic _bannerImage;

  // Función para seleccionar el archivo de banner
  Future<void> _pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,  // Filtrar solo imágenes
    );

    if (result != null) {
      setState(() {
        _bannerImage = result.files.single.path;  // Obtener la ruta del archivo seleccionado
      });
    }
  }

  void _uploadBanner() async {
    if (_bannerImage != null) {
      await _categoryController.uploadCategory(
        pickedImage: null, // No se sube una imagen de categoría, solo el banner
        bannerImage: _bannerImage,
        name: "", // No se requiere nombre de categoría
        context: context,
      );
    }
    setState(() {
      _bannerImage = null;  // Limpiar la imagen después de subirla
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Upload Banner',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
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
                    child: _bannerImage == null
                        ? const Text('Upload Banner Image...')
                        : Image.file(
                      File(_bannerImage),  // Mostrar la imagen seleccionada
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _pickBannerImage,
                  child: const Text('Select Banner Image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _uploadBanner,
                  child: const Text('Upload Banner'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
