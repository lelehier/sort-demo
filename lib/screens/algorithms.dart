import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/bubble_sort.dart';
import 'package:sort_demo/screens/bubblesort_screen.dart';
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
                  'Vergleichbasiert',
                  Wrap(
                    children: [
                      SelectButton(
                        'Bubblesort',
                        'Beschreibung hier oder so',
                        onpressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BubbleSortScreen();
                          }),
                        ),
                      ),
                      SelectButton('Insertion Sort', 'Coming soon'),
                      SelectButton('Selection Sort', 'Coming soon'),
                      SelectButton('Shellsort', 'Coming soon'),
                      SelectButton('Quicksort', 'Coming soon'),
                      SelectButton('Mergesort', 'Coming soon'),
                    ],
                  ),
                ),
                StaticCard(
                    'Nicht vergleichbasiert',
                    Wrap(
                      children: [
                        SelectButton('Bucket Sort', 'Coming soon'),
                        SelectButton('Counting Sort', 'Coming soon'),
                        SelectButton('Radix Sort', 'Coming soon'),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
