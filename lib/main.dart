import 'package:flutter/material.dart';
import 'package:ncktestapp/features/home/presentation/provider.dart';
import 'package:provider/provider.dart';

import 'features/home/presentation/pages/home-screen.dart';
import 'features/home/presentation/pages/item-screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nck test',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


