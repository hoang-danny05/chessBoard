import 'package:flutter/material.dart';

import '../widgets/game_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameBoard(),
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text("Chess"),
      ),
    );
  }
}
