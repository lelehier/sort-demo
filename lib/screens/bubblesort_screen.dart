import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sort_demo/algorithms/bubble_sort.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:sort_demo/widgets/settings_item.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:url_launcher/link.dart';

class BubbleSortScreen extends StatefulWidget {
  const BubbleSortScreen({Key? key}) : super(key: key);

  @override
  State<BubbleSortScreen> createState() => _BubbleSortScreenState();
}

class _BubbleSortScreenState extends State<BubbleSortScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          ScreenHeader('Bubble Sort', back: true),
          SliverList(
            delegate: SliverChildListDelegate([
              SortCard(),
            ]),
          ),
        ],
      ),
    );
  }
}
