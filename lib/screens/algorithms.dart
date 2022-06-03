import 'package:flutter/material.dart';
import 'package:sort_demo/widgets/screen_header.dart';

class Algorithms extends StatelessWidget {
  const Algorithms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ScreenHeader('Algorithmen'),
          SliverList(
            delegate: SliverChildListDelegate(
              [],
            ),
          ),
        ],
      ),
    );
  }
}
