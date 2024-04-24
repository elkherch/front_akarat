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
  // List<String> categories = ['Maison', '50', 'Terrain', 'Local commercial'];
  final List<String> categories =  [  '24'.tr, '33'.tr, '34'.tr, '35'.tr, '49'.tr, '50'.tr, '51'.tr,
    '52'.tr, '53'.tr, '54'.tr, '55'.tr, '56'.tr, '57'.tr, '58'.tr,
    '59'.tr, '60'.tr, '61'.tr, '62'.tr, '63'.tr, '64'.tr, '65'.tr,
    '66'.tr, '67'.tr,
  ];
  
  List<String> villes = ['Ville','39'.tr,'40'.tr, '41'.tr, '68'.tr,'69'.tr,'70'.tr,'71'.tr,'72'.tr,'73'.tr,'75'.tr,'76'.tr,'77'.tr];
  Map<String, List<String>> quartiers = {
    'Ville': [''],
    '39'.tr: ['182'.tr, '183'.tr],
    '40'.tr: ['169'.tr, '170'.tr, '171'.tr,'172'.tr,'173'.tr,'174'.tr,'175'.tr,'176'.tr,'177'.tr],
    '41'.tr: ['124'.tr, '125'.tr, '126'.tr, '127'.tr, '128'.tr, '129'.tr,],
    '68'.tr: ['130'.tr, '131'.tr,'132'.tr,'133'.tr],
    '69'.tr: ['134'.tr, '135'.tr,'136'.tr,'137'.tr,'138'.tr],
    '70'.tr: ['139'.tr, '140'.tr, '141'.tr,'142'.tr],
    '71'.tr: ['143'.tr, '144'.tr, '145'.tr,'146'.tr,'147'.tr],
    '72'.tr: ['148'.tr, '149'.tr, '150'.tr,'151'.tr,'152'.tr,'153'.tr],
    '73'.tr: ['154'.tr, '155'.tr, '156'.tr,'157'.tr],
    '74'.tr: ['159'.tr, '160'.tr, '161'.tr],
    '75'.tr: ['162'.tr, '163'.tr],
    '76'.tr: ['164'.tr, '165'.tr,'166'.tr],
    '77'.tr: ['167'.tr, '168'.tr],

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
                     labelText: '24'.tr
                   ),
                ),
                const SizedBox(height: 16),
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
                           labelText: '158'.tr
                         ),
                    );
                  },
                ),
                const SizedBox(height: 16),
               
                TextInput(
                  obscureText: false,
                    labelText: '31'.tr, 
                    myController: prixController,
                     valid: (val) {
                      return ;
                    }, 
                     isNumber: true),
                const SizedBox(height: 16),
                AnnonceBtn(
                  onpressed:  () {
                    if (selectedCategorie != '' && selectedQuartier.value != '' && selectedVille.value != '') {
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
