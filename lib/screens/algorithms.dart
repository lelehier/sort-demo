import 'package:flutter/material.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Algorithms extends StatelessWidget {
  const Algorithms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          ScreenHeader(AppLocalizations.of(context)!.algorithms),
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
