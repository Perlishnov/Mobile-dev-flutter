import 'package:flutter/material.dart';
import '../../../controllers/banner_controller.dart';  // Asegúrate de que tu controller tenga el método loadBanners
import '../../../models/banner_model.dart';  // Aquí también deberías tener la referencia para tus banners

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late final Future<List<BannerModel>> _banners;  // Asegúrate de que la respuesta de loadBanners sea una lista de URLs de imagen
  final BannerController _bannerController = BannerController();

  @override
  void initState() {
    super.initState();
    _banners = _bannerController.loadBanners();  // Cargar banners
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: _banners,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No banners found"),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else {
          // Mostrar los banners en un GridView
          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,  // Puedes modificar este valor dependiendo de cómo quieras distribuir los banners
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    snapshot.data![index].banner,  // Mostrar la imagen del banner
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Banner $index',  // Opcional, si quieres poner un título o nombre
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
