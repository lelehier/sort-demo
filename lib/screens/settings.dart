import 'package:flutter/material.dart';
import 'package:sort_demo/widgets/settings_item.dart';
import 'package:sort_demo/widgets/screen_header.dart';

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
          const ScreenHeader('Einstellungen'),
          SliverList(
            delegate: SliverChildListDelegate(
              // Aktuell reine Platzhalter
              [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Divider(),
                ),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse('https://sfseeger.ddns.net/mango-finger/todo'),
                  builder: (context, followLink) => SettingsItem(
                    const Icon(Icons.code_rounded),
                    'Sourcecode',
                    onPressed: followLink,
                  ),
                ),
                SettingsItem(
                  const Icon(Icons.copyright_rounded),
                  'Lizensen',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Licenses()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
