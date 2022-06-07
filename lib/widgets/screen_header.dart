import 'package:flutter/material.dart';
import 'dart:ui';

class ScreenHeader extends StatelessWidget {
  ScreenHeader(this.text, {this.back = false, Key? key}) : super(key: key);

  final String text;
  bool back;
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        return SliverAppBar(
          actions: [
            (back == true)
                ? IconButton(
                    alignment: Alignment.center,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close_outlined))
                : SizedBox(),
          ],
          automaticallyImplyLeading: false,
          stretch: true,
          elevation: 0,
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(0.8),
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
            title: BackdropFilter(
              filter: ImageFilter.blur(
                // Aktiviert Blur 15 errst wenn 10 gescrollt wurde
                sigmaX: constraints.scrollOffset > 15 ? 15 : 0,
                sigmaY: constraints.scrollOffset > 15 ? 15 : 0,
              ),
              child: FittedBox(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.11,
        );
      },
    );
  }
}
