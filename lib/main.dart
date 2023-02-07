import 'package:chew_jump/colum_provider.dart';
import 'package:chew_jump/screens/main_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [ChangeNotifierProvider(create: (context)=>ColumProvider(),)],
  child: ChewApp(),
  ),
  );
}
class ChewApp extends StatelessWidget {
  const ChewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MainScreens(),
      ),
    );
  }
}
