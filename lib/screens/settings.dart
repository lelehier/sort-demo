import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sort_demo/screens/about.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:sort_demo/widgets/settings_item.dart';
import 'package:url_launcher/link.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          ScreenHeader(AppLocalizations.of(context)!.settings),
          SliverList(
            delegate: SliverChildListDelegate(
              // Aktuell reine Platzhalter
              [
                SettingsItem(const Icon(Icons.translate_rounded),
                    AppLocalizations.of(context)!.languages),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Divider(),
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse('https://github.com/lelehier/sort-demo'),
                  builder: (context, followLink) => SettingsItem(
                    const Icon(Icons.code_rounded),
                    AppLocalizations.of(context)!.sourcecode,
                    onPressed: followLink,
                  ),
                ),
                SettingsItem(
                  const Icon(Icons.copyright_rounded),
                  AppLocalizations.of(context)!.licenses,
                  onPressed: () {
                    /*
                  - TODO: Add Licende screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Licenses()));
                  */
                  },
                ),
                SettingsItem(Icon(Icons.info_outline_rounded), 'Über',
                    onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return AboutScreen();
                        }))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
