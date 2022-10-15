// ignore_for_file: sort_child_properties_last

import 'package:chess_board/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum chess_piece {
  whiteKing,
  whiteQueen,
  whiteBishop,
  whiteKnight,
  whiteRook,
  whitePawn,
  blackKing,
  blackQueen,
  blackBishop,
  blackKnight,
  blackRook,
  blackPawn,
  empty
}

class Cell extends StatelessWidget {
  final GameController controller = Get.find<GameController>();

  late final int columnNumber, rowNumber;
  late final bool darksquare;
  chess_piece piece = chess_piece.empty;
  Cell(
      {super.key,
      required this.columnNumber,
      required this.rowNumber,
      required this.darksquare}) {
    piece =
        controller.intToChessPiece[controller.board[columnNumber][rowNumber]];
  }

  static const Map<chess_piece, Image?> pieceToWidget = {
    chess_piece.empty: null,
    chess_piece.whitePawn:
        Image(image: AssetImage("../lib/assets/ChessSprites/WhitePawn.png")),
    chess_piece.whiteKnight:
        Image(image: AssetImage("../lib/assets/ChessSprites/WhiteKnight.png")),
    chess_piece.whiteBishop:
        Image(image: AssetImage("../lib/assets/ChessSprites/WhiteBishop.png")),
    chess_piece.whiteRook:
        Image(image: AssetImage("../lib/assets/ChessSprites/WhiteRook.png")),
    chess_piece.whiteQueen:
        Image(image: AssetImage("../lib/assets/ChessSprites/WhiteQueen.png")),
    chess_piece.whiteKing:
        Image(image: AssetImage("../lib/assets/ChessSprites/WhiteKing.png")),
    chess_piece.blackPawn:
        Image(image: AssetImage("../lib/assets/ChessSprites/BlackPawn.png")),
    chess_piece.blackKnight:
        Image(image: AssetImage("../lib/assets/ChessSprites/BlackKnight.png")),
    chess_piece.blackBishop:
        Image(image: AssetImage("../lib/assets/ChessSprites/BlackBishop.png")),
    chess_piece.blackRook:
        Image(image: AssetImage("../lib/assets/ChessSprites/BlackRook.png")),
    chess_piece.blackQueen:
        Image(image: AssetImage("../lib/assets/ChessSprites/BlackQueen.png")),
    chess_piece.blackKing:
        Image(image: AssetImage("../lib/assets/ChessSprites/BlackKing.png")),
  };

  MouseCursor _getCursor() {
    return piece == chess_piece.empty
        ? SystemMouseCursors.basic
        : SystemMouseCursors.click;
  }

  void _onTap() {
    controller.cellClicked(row: rowNumber, column: columnNumber);
  }

  Container _buildContainer(BuildContext context) {
    print("Da container do be rebuildin");
    return Container(
      decoration: BoxDecoration(
          color: controller.actionBoard[rowNumber][columnNumber] == 2
              ? Colors.yellow
              : darksquare
                  ? Colors.green.shade500
                  : Colors.yellow.shade100),
      height: MediaQuery.of(context).size.width * (1 / 8),
      width: MediaQuery.of(context).size.width * (1 / 8),
      child: pieceToWidget[piece],
    );
  }

  Widget _rootBuild(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        child: Obx(() => Container(
              decoration: BoxDecoration(
                  color: controller.actionBoard[rowNumber][columnNumber] == 2
                      ? Colors.yellow
                      : darksquare
                          ? Colors.green.shade500
                          : Colors.yellow.shade100),
              height: MediaQuery.of(context).size.width * (1 / 8),
              width: MediaQuery.of(context).size.width * (1 / 8),
              child: pieceToWidget[piece],
            )),
        cursor: _getCursor(),
      ),
      onTap: _onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _rootBuild(context);
  }
}
