import 'package:chess_board/widgets/board_column.dart';
import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import 'package:get/get.dart';

class BoardGrid extends StatelessWidget {
  BoardGrid({super.key});

  final GameController controller = Get.find<GameController>();

  List<BoardColumn> _buildGrid() {
    int i = 0;
    return controller.board
        .map((columns) => BoardColumn(
              columnNumber: i++,
            ))
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _buildGrid(),
      ),
    );
  }
}
