import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/bubble_sort.dart';
import 'package:sort_demo/widgets/screen_header.dart';
import 'package:sort_demo/widgets/settings_item.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/widgets/tile.dart';
import 'package:url_launcher/link.dart';

import '../providers/graph_provider.dart';

class HeapSortScreen extends StatefulWidget {
  const HeapSortScreen({Key? key}) : super(key: key);

  @override
  State<HeapSortScreen> createState() => _HeapSortScreenState();
}

class _HeapSortScreenState extends State<HeapSortScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          ScreenHeader('Heapsort', back: true),
          SliverList(
            delegate: SliverChildListDelegate([
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  SortCard("heap"),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: 500, maxWidth: 1000),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Tile(
                            'Einstellungen',
                            Icon(Icons.settings),
                            [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.speed_rounded),
                                  Expanded(
                                    child: Slider(
                                      min: 20,
                                      max: 1000,
                                      value: context.watch<Graph>().slidervalue,
                                      onChanged: ((value) => context
                                          .read<Graph>()
                                          .changespeed(value)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Tile(
                            'Info',
                            Icon(Icons.info_rounded),
                            [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Icon(
                                        Icons.bubble_chart_rounded,
                                        size: 50,
                                      )),
                                  Flexible(
                                    child: Text(''),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
