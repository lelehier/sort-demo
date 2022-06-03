import 'package:flutter/material.dart';
import 'dart:ui';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader(this.text, {Key? key}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        return SliverAppBar(
          automaticallyImplyLeading: false,
          stretch: true,
          elevation: 0,
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(0.6),
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            title: BackdropFilter(
              filter: ImageFilter.blur(
                // Aktiviert Blur 15 errst wenn 10 gescrollt wurde
                sigmaX: constraints.scrollOffset > 10 ? 15 : 0,
                sigmaY: constraints.scrollOffset > 10 ? 15 : 0,
              ),
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
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.12,
        );
      },
    );
  }
}
