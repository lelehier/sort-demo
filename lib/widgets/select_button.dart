import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  SelectButton(this.title, this.desciption, {this.onpressed, super.key});

  String title;
  String desciption;
  Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(400, 20)),
          ),
          onPressed: onpressed,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                child: Text(
                  desciption,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          )),
    );
  }
}
