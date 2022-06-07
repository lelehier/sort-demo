import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:sort_demo/widgets/settings_item.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:url_launcher/link.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          ScreenHeader('Über', back: true),
          SliverList(
            delegate: SliverChildListDelegate([
              FlutterLogo(
                style: FlutterLogoStyle.horizontal,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
