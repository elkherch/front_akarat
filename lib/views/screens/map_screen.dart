// ignore_for_file: deprecated_member_use

import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:akarat/models/biens_immobiliers_models.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/gocodingservice.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final biensImmobiliersControllerImp mapController = Get.put(biensImmobiliersControllerImp());
  final scaffoldContext = Get.context;
  late MapController _mapController;
  double _zoom = 6.0;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _zoomIn() {
    setState(() {
      _zoom += 1.0; // Augmentez le niveau de zoom
      _mapController.move(_mapController.center, _zoom); // Appliquez le nouveau zoom
    });
  }

  void _zoomOut() {
    setState(() {
      _zoom -= 1.0; // Diminuez le niveau de zoom
      _mapController.move(_mapController.center, _zoom); // Appliquez le nouveau zoom
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center:const LatLng(20.2544, -9.2395),
        zoom: _zoom,
        interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
      ),
      children: [
        TileLayer(
             //  urlTemplate:"https://api.mapbox.com/styles/v1/twinnerag/cllnbhfsb000b01nz01rg3kby/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidHdpbm5lcmFnIiwiYSI6ImNsbG1ib3FmdDFoZWEzY3Q2ODRoamloN2UifQ.FVQHAk7oy1RCyvlDqeZW5A",
           
              urlTemplate:"https://api.mapbox.com/styles/v1/twinnerag/cllnbkuiw000c01pe82l86m0s/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidHdpbm5lcmFnIiwiYSI6ImNsbG1ib3FmdDFoZWEzY3Q2ODRoamloN2UifQ.FVQHAk7oy1RCyvlDqeZW5A",
             
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration:const BoxDecoration(
                color: AppColor.backgroundcolor,

                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: IconButton(
                  onPressed: _zoomIn,
                   icon: const Icon(Icons.add,color:AppColor.whiteColor,),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration:const BoxDecoration(
                color: AppColor.backgroundcolor,
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: IconButton(
                  onPressed: _zoomOut,
                  icon: const Icon(Icons.remove, color: AppColor.whiteColor,),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<Marker>>(
          future: _getMarkers(mapController.biens, scaffoldContext!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: AppColor.backgroundcolor,
                  strokeWidth: 2,
                ),
              );
            } else {
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else {
                return MarkerLayer(
                  markers: snapshot.data!,
                );
              }
            }
          },
        ),
      ],
    );
  }

  Future<List<Marker>> _getMarkers(List<Biens_immobiliers> properties, BuildContext context) async {
    final List<Marker> markers = [];
    biensImmobiliersControllerImp controller = Get.find<biensImmobiliersControllerImp>();
    for (var property in properties) {
      final coordinates = await GeoCodingService.getCoordinatesFromCityName(property.region!);
      if (coordinates != null) {
        markers.add(
          Marker(
            width: 120.0,
            height: 30.0,
            point: LatLng(coordinates['latitude']!, coordinates['longitude']!),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  controller.goToDetails(property.bienID!, property.categorie!);
                },
                child: Tooltip(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  message: "${property.region}, ${property.surface}",
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Text(
                      "${property.prix}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }
    return markers;
  }
}
