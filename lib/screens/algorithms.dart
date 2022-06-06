import 'package:flutter/material.dart';
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
                      SelectButton('Bubblesort', 'Beschreibung hier oder so'),
                      SelectButton('Insertion Sort', 'Comming soon'),
                      SelectButton('Selection Sort', 'Comming soon'),
                      SelectButton('Shellsort', 'Comming soon'),
                      SelectButton('Quicksort', 'Comming soon'),
                      SelectButton('Mergesort', 'Comming soon'),
                    ],
                  ),
                ),
                StaticCard(
                    'Nicht vergleichbasiert',
                    Wrap(
                      children: [
                        SelectButton('Bucket Sort', 'Comming soon'),
                        SelectButton('Counting Sort', 'Comming soon'),
                        SelectButton('Radix Sort', 'Comming soon'),
                      ],
                    )),
                SortCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
