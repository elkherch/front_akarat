import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:akarat/services/iniHive.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/views/layouts/changelangue.dart';
import 'package:akarat/views/layouts/translation.dart';
import 'package:akarat/views/screens/add_annoce.dart';
import 'package:akarat/views/screens/annonce.dart';
import 'package:akarat/views/screens/favorie_screen.dart';
import 'package:akarat/views/screens/home_screen.dart';
import 'package:akarat/views/screens/langue.dart';
import 'package:akarat/views/screens/login.dart';
import 'package:akarat/views/screens/main_screen.dart';
import 'package:akarat/views/screens/map_screen.dart';
import 'package:akarat/views/screens/parametre.dart';
import 'package:akarat/views/screens/publicite/p1.dart';
import 'package:akarat/views/screens/publicite/p2.dart';
import 'package:akarat/views/screens/publicite/p3.dart';
import 'package:akarat/views/screens/rechercher_immobilie.dart';
import 'package:akarat/views/screens/register.dart';
import 'package:akarat/views/screens/resoult.dart';
import 'package:akarat/views/themes/routes.dart';
import 'package:akarat/views/widgets/trip_detail_biens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialServices();
  Get.put(CrudGet());
  Get.put(CrudPost());
  await initHive();
  Get.put(MyTranslations());
  Get.put(biensImmobiliersControllerImp());
  Get.put(Informations1ControllerImp());
  // Get.put(Informations2ControllerImp());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: controller.language,
      theme: controller.apptheme,
      initialRoute: '/main',
      getPages: [
        GetPage(name: AppRoutes.langue, page: () => const langue()),
        GetPage(name: AppRoutes.main, page: () => const MainScreen()),
        GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
        GetPage(name: AppRoutes.favorie, page: () => const FavorieScreen()),
        GetPage(name: AppRoutes.map, page: () => const MapScreen()),
        // GetPage(name: AppRoutes.tripdetails, page: () => const TripDetailsBiens(title: '',)),
        GetPage(name: AppRoutes.rechercher, page: () =>const RechercherImmobilie()),
        GetPage(name: AppRoutes.register, page: () => Register()),
        GetPage(name: AppRoutes.annonce, page: () => Annonce()),
        GetPage(name: AppRoutes.add_annonce, page: () =>const AddAnnonce()),
        GetPage(name: AppRoutes.parametre, page: () => const Parametre()),
        GetPage(name: AppRoutes.login, page: () =>const Login()),
        GetPage(name: AppRoutes.publicite, page: () => const Informations1()),
                GetPage(name: AppRoutes.publicite2, page: () => Informations2()),
        GetPage(name: AppRoutes.publicite3, page: () =>const Informations3()),
        GetPage(name: AppRoutes.recherche, page: () =>const ReloultScreen()),



      ],
    );
  }
}
