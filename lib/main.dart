import 'package:akarat/services/Biens_immobiliersService.dart/biens_immobiliers_service.dart';
import 'package:akarat/views/DashboardAdmin/langueAdmin.dart';
import 'package:akarat/views/DashboardAdmin/publiciteAdmin/p1Admin.dart';
import 'package:akarat/views/DashboardAdmin/publiciteAdmin/p2Admin.dart';
import 'package:akarat/views/DashboardAdmin/publiciteAdmin/p3Admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akarat/views/DashboardAdmin/adminScreen.dart';
import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/controllers/publicite/p1_controller.dart';
import 'package:akarat/services/iniHive.dart';
import 'package:akarat/services/services.dart';
import 'package:akarat/localization/changelangue.dart';
import 'package:akarat/localization/translation.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialServices();
  Get.put(CrudGet());
  Get.put(CrudPost());
  await initHive();
  Get.put(MyTranslations());
  Get.put(biensImmobiliersControllerImp());
  Get.put(Informations1ControllerImp());
  final Myservices myServices = Get.find();

  bool isAdmin = myServices.sharedPreferences.getBool("isAdministrateur") ?? false;
  Widget initialScreen = isAdmin ? const AdminScreen() :  const MainScreen();
  runApp( MyApp(initialScreen: initialScreen));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;

   MyApp({Key? key, required this.initialScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    biensImmobiliersControllerImp controllerBien = Get.put(biensImmobiliersControllerImp());

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: controller.language,
      theme: controller.apptheme,
      // initialRoute: initialScreen,
      home: initialScreen,
      initialBinding: BindingsBuilder(() {
        Get.put(CrudPost());
        Get.put(CrudGet());
        Get.put(Informations1ControllerImp());

        Get.put(controllerBien);
      }),
      getPages: [
        GetPage(name: AppRoutes.langue, page: () => const langue()),
        GetPage(name: AppRoutes.langueAdmin, page: () => const LangeAdmin()),
        GetPage(name: AppRoutes.main, page: () => const MainScreen()),
        GetPage(name: AppRoutes.mainAdmin, page: () => const AdminScreen()),
        GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
        GetPage(name: AppRoutes.favorie, page: () => const FavorieScreen()),
        GetPage(name: AppRoutes.map, page: () =>  MapScreen()),
        // GetPage(name: AppRoutes.tripdetails, page: () => const TripDetailsBiens(title: '',)),
        GetPage(name: AppRoutes.rechercher, page: () =>const RechercherImmobilie()),
        GetPage(name: AppRoutes.register, page: () => Register()),
        GetPage(name: AppRoutes.annonce, page: () => Annonce()),
        GetPage(name: AppRoutes.add_annonce, page: () =>const AddAnnonce()),
        GetPage(name: AppRoutes.parametre, page: () => const Parametre()),
        GetPage(name: AppRoutes.login, page: () =>const Login()),
        GetPage(name: AppRoutes.publicite, page: () =>  Informations1()),
        GetPage(name: AppRoutes.publicite2, page: () => Informations2()),
        GetPage(name: AppRoutes.publicite3, page: () =>const Informations3()),
            GetPage(name: AppRoutes.publiciteAdmin, page: () =>  Informations1Admin()),
        GetPage(name: AppRoutes.publicite2Admin, page: () => Informations2Admin()),
        GetPage(name: AppRoutes.publicite3Admin, page: () =>const Informations3Admin()),
        GetPage(name: AppRoutes.recherche, page: () =>const ReloultScreen()),
      ],
    );
  }
}
