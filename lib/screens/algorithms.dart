import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/bubble_sort.dart';
import 'package:sort_demo/screens/bubblesort_screen.dart';
import 'package:sort_demo/screens/heapsort_screen.dart';
import 'package:sort_demo/screens/shellsort_screen.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sort_demo/widgets/select_button.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/widgets/static_card.dart';

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
              [
                StaticCard(
                  'Vergleichsbasiert',
                  Wrap(
                    children: [
/*                      SelectButton(
                        'Bubblesort',
                        '',
                        onpressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BubbleSortScreen();
                          }),
                        ),
                      ),
                      SelectButton('Insertion Sort', 'Coming soon'),
*/
                      SelectButton(
                        'Shellsort',
                        '',
                        onpressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const ShellSortScreen();
                          }),
                        ),
                      ),
                      SelectButton(
                        'Heapsort',
                        '',
                        onpressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const HeapSortScreen();
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                StaticCard(
                    'Nicht vergleichsbasiert',
                    Wrap(
                      children: [],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
