import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sort_demo/l10n/l10n.dart';
import 'package:sort_demo/screens/algorithms.dart';
import 'package:sort_demo/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentnavigationbarindex = 0;
  Widget _currentscreen = const Algorithms();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          );
          darkColorScheme = ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.dark);
        }
        return MaterialApp(
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          themeMode: ThemeMode.system,
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: AnimatedSwitcher(
              switchInCurve: Curves.easeInOutCirc,
              duration: const Duration(
                milliseconds: 150,
              ),
              child: _currentscreen,
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: _currentnavigationbarindex,
              elevation: 0,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              animationDuration: const Duration(seconds: 1, microseconds: 500),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              destinations: const [
                NavigationDestination(
                    icon: const Icon(Icons.move_down_rounded),
                    label: 'Algorithmus'),
                NavigationDestination(
                    icon: const Icon(Icons.settings), label: 'Einstellungen'),
              ],
              onDestinationSelected: (int index) {
                setState(() {
                  _currentnavigationbarindex = index;
                  _currentscreen = indexScreen(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}

Widget indexScreen(int index) {
  switch (index) {
    case 1:
      return const SettingsScreen();
    default:
      return const Algorithms();
  }
}
