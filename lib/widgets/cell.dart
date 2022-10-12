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
  late final int columnNumber, rownumber;
  late final bool darksquare;
  chess_piece piece = chess_piece.empty;
  Cell(
      {super.key,
      required this.columnNumber,
      required this.rownumber,
      required this.darksquare});

  final GameController controller = Get.find<GameController>();

  static const Map<chess_piece, Image?> pieceToWidget = {
    chess_piece.empty:
        Image(image: AssetImage('../lib/assets/ChessSprites/WhitePawn.png')),
    chess_piece.whitePawn:
        Image(image: AssetImage("../lib/assets/CshessSprites/WhitePawn.png")),
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

  Image _buildCoin() {
    piece =
        controller.intToChessPiece[controller.board[columnNumber][rownumber]];
    print(piece);
    return pieceToWidget[piece]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: darksquare ? Colors.green.shade500 : Colors.brown.shade100),
      height: 25,
      width: 25,
      child: _buildCoin(),
    );
  }
}
