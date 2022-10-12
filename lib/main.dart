import 'package:chess_board/core/bindings/core_bindings.dart';
import 'package:chess_board/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: GameScreen(), => unnecessary with GetX
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => GameScreen()),
      ],
      initialBinding: MainBindings(),
    );
  }
}
