import 'package:chess_board/controllers/game_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'cell.dart';

class BoardRow extends StatelessWidget {
  late final int rowNumber;
  final GameController controller = Get.find<GameController>();
  BoardRow({super.key, required this.rowNumber});

  List<Cell> _buildRow() {
    int isDarksquare = rowNumber.isEven ? 1 : 0;
    int i = 0;
    return controller.board[rowNumber]
        .map((cell) => Cell(
              columnNumber: i++,
              rowNumber: rowNumber,
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
