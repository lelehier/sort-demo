import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectButton extends StatelessWidget {
  SelectButton(this.title, this.desciption, {this.onpressed, super.key});

  String title;
  String desciption;
  Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressed, child: Text("bakja"));
  }
}
