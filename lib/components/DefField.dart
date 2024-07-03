import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obsecure;
  final String lable;
  final IconData? iconName;
  final Function()? iconFunction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? inputtype;
  final List<TextInputFormatter>? inputformatter;
  const DefField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.obsecure,
      required this.lable,
      this.iconName,
      this.iconFunction,
      this.inputtype,
      this.validator,
      this.onChanged,
       this.inputformatter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 12, 0, 0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        obscureText: obsecure,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(7),
            focusColor: const Color.fromRGBO(5, 244, 164, 1),
            suffixIcon: IconButton(
              onPressed: iconFunction ?? () {},
              style: const ButtonStyle(),
              icon: Icon(iconName),
              
            ),
            labelStyle: const TextStyle(color: Colors.black),
            floatingLabelStyle: const TextStyle(
              color: Colors.black,
            ),
            hintText: hint,
            labelText: lable,
            fillColor:Color.fromARGB(235, 235, 244, 237),
            filled: true,
            hintFadeDuration:const  Duration(seconds: 1),
           ),
        inputFormatters:inputformatter,
        keyboardType: inputtype,
      ),
    );
  }
}
