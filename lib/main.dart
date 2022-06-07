import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sort_demo/providers/graph_provider.dart';
import 'package:sort_demo/screens/wrapper.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isAndroid) {
    // Transparente Stausbar für cleaneren look (android) ^‿^
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent));
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Graph()),
    ],
    child: Wrapper(),
  ));
}
