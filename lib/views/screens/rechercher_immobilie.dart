import 'package:akarat/controllers/biens_immobiliers_controllers.dart';
import 'package:akarat/views/themes/colors.dart';
import 'package:akarat/views/widgets/AnnonceBtn.dart';
import 'package:akarat/views/widgets/TextField.dart';
import 'package:akarat/views/widgets/TextFieldForm.dart';
import 'package:akarat/views/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechercherImmobilie extends StatefulWidget {
  const RechercherImmobilie({Key? key}) : super(key: key);

  @override
  State<RechercherImmobilie> createState() => _RechercherImmobilieState();
}

class _RechercherImmobilieState extends State<RechercherImmobilie> {
  TextEditingController prixController = TextEditingController();
  List<String> categories = ['Maison', '50', 'Terrain', 'Local commercial'];
  List<String> villes = ['Ville', '40'.tr, '39'.tr, '41'.tr,'68'.tr,'69'.tr,'70'.tr,'71'.tr,'72'.tr,'73'.tr,'75'.tr,'77'.tr];
  Map<String, List<String>> quartiers = {
    'Ville': [''],
    '40'.tr: ['36'.tr, 'Quartier B', 'Quartier C'],
    '39'.tr: ['Quartier X', 'Quartier Y', 'Quartier Z'],
    '41'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '68'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '69'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '70'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '71'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '72'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '73'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '74'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '75'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],
    '77'.tr: ['Quartier E', 'Quartier F', 'Quartier J'],

  };
  ValueNotifier<String> selectedVille = ValueNotifier<String>('Ville');
  ValueNotifier<String?> selectedQuartier = ValueNotifier<String?>(null);
  String? selectedCategorie;

  @override
  Widget build(BuildContext context) {
    biensImmobiliersControllerImp controller = Get.put(biensImmobiliersControllerImp());
    return Scaffold(
      appBar: AppBarCustam(title: '32'.tr),
      body: GetBuilder<biensImmobiliersControllerImp>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                   contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: const BorderSide(color: AppColor.black),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: const BorderSide(color: AppColor.grey300),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(8),
                     borderSide: const BorderSide(color: AppColor.black),
                   ),
                 ),
                  value: 'Ville',
                  onChanged: (value) {
                    selectedVille.value = value!;
                    if (quartiers[value]!.isNotEmpty) {
                      selectedQuartier.value = quartiers[value]!.first;
                    } else {
                      selectedQuartier.value = null;
                    }
                  },
                  items: villes.map((ville) {
                    return DropdownMenuItem<String>(
                      value: ville,
                      child: Text(ville),
                    );
                  }).toList(),
                  
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<String>(
                  valueListenable: selectedVille,
                  builder: (context, ville, _) {
                    return DropdownButtonFormField<String>(
                      value: selectedQuartier.value,
                      onChanged: (value) {
                        selectedQuartier.value = value;
                      },
                      items: quartiers[ville]!.map((quartier) {
                        return DropdownMenuItem<String>(
                          value: quartier,
                          child: Text(quartier),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                           contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8),
                             borderSide: const BorderSide(color: AppColor.black),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8),
                             borderSide: const BorderSide(color: AppColor.grey300),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8),
                             borderSide: const BorderSide(color: AppColor.black),
                           ),
                           labelText: 'Quartier'
                         ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: null,
                  onChanged: (value) {
                    setState(() {
                      selectedCategorie = value;
                    });
                  },
                  items: categories.map((categorie) {
                    return DropdownMenuItem<String>(
                      value: categorie,
                      child: Text(categorie),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                     contentPadding: const EdgeInsets.fromLTRB(10, 15, 20, 15),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                       borderSide: const BorderSide(color: AppColor.black),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                       borderSide: const BorderSide(color: AppColor.grey300),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(8),
                       borderSide: const BorderSide(color: AppColor.black),
                     ),
                     labelText: 'Catégorie'
                   ),
                ),
                const SizedBox(height: 16),
                TextInput(
                  obscureText: false,
                    labelText: 'Prix', 
                    myController: prixController,
                     valid: (val) {
                      return ;
                    }, 
                     isNumber: true),
                const SizedBox(height: 16),
                AnnonceBtn(
                  onpressed:  () {
                    if (selectedCategorie != '' && selectedQuartier.value != '' && selectedVille.value != '' && prixController.text != '') {
                    controller.goTorechercher(selectedCategorie!, selectedQuartier.value!, selectedVille.value);
                   
                    } 
                  },
                   text: '32'.tr)
                
              ],
            ),
          );
        }
      ),
    );
  }
}
