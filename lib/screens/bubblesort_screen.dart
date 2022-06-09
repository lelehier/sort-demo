import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/bubble_sort.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:sort_demo/widgets/settings_item.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/widgets/tile.dart';
import 'package:url_launcher/link.dart';

import '../providers/graph_provider.dart';

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
              Tile(
                'Hi',
                [
                  FlutterLogo(),
                  Slider(
                    min: 20,
                    max: 1000,
                    value: context.watch<Graph>().slidervalue,
                    onChanged: ((value) =>
                        context.read<Graph>().changespeed(value)),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
