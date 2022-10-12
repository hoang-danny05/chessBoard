import 'package:flutter/material.dart';
import 'board_grid.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BoardGrid(),
    );
  }
}
