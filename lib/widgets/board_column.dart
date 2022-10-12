import 'package:chess_board/controllers/game_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'cell.dart';

class BoardColumn extends StatelessWidget {
  late final int columnNumber;
  final GameController controller = Get.find<GameController>();
  BoardColumn({super.key, required this.columnNumber});

  List<Cell> _buildRow() {
    int isDarksquare = columnNumber.isEven ? 1 : 0;
    int i = 0;
    return controller.board[columnNumber]
        .map((cell) => Cell(
              rowNumber: i++,
              columnNumber: columnNumber,
              darksquare: isDarksquare++ % 2 == 0,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildRow(),
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
