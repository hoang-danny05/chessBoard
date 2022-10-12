import 'package:chess_board/widgets/board_grid.dart';
import 'package:chess_board/widgets/cell.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> setValue) => _board.value = setValue;

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }

  static const List<int> _whitePieces = [5, 4, 3, 1, 2, 3, 4, 5];

  void _buildBoard() {
    board = [
      _whitePieces,
      List.filled(8, 6),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 12),
      _whitePieces.map((pieceInt) => pieceInt + 6).toList(),
    ];
  }

  Map intToChessPiece = {
    0: chess_piece.empty,
    1: chess_piece.whiteKing,
    2: chess_piece.whiteQueen,
    3: chess_piece.whiteBishop,
    4: chess_piece.whiteKnight,
    5: chess_piece.whiteRook,
    6: chess_piece.whitePawn,
    7: chess_piece.blackKing,
    8: chess_piece.blackQueen,
    9: chess_piece.blackBishop,
    10: chess_piece.blackKnight,
    11: chess_piece.blackRook,
    12: chess_piece.blackPawn,
  };
}
