import 'package:akarat/views/themes/colors.dart';
import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final bool obscureText;
  final bool isNumber;
  final IconData prefixIcon;
  final IconData? sefixIcon;
  final String labelText; // Ajout du texte pour le champ de texte

  final TextEditingController myController;
  final String? Function(String?)? valid;
  final void Function()? onTapIcon;
  
  const TextFieldLogin({
    Key? key,
    required this.obscureText,
    required this.prefixIcon,
    required this.labelText, // Ajout du paramètre labelText
    this.sefixIcon,
    required this.myController,
    required this.valid,
    required this.isNumber,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      obscureText: obscureText,
      controller: myController,
      decoration: InputDecoration(
        labelText: labelText, // Utilisation du labelText dans InputDecoration
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0), // Ajout de la marge à gauche
          child: Icon(
            prefixIcon,
            color: AppColor.backgroundcolor,
          ),
        ),
        suffixIcon: InkWell(
          onTap: onTapIcon,
          child: Icon(
            sefixIcon,
            color: AppColor.whiteColor,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(15, 5, 10, 5),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        disabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColor.black),
    );
  }
}
