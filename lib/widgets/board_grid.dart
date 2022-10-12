import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import 'board_column.dart';
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
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _buildGrid(),
      ),
    );
  }
}
