// ignore_for_file: prefer_final_fields

import 'package:chess_board/widgets/cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>(); // board that contains pieces
  List<List<int>> get board => _board.value;
  set board(List<List<int>> setValue) => _board.value = setValue;
  //BOARD IS INDEXED AS [COLUMN][ROW]
  var _actionBoard = RxList<
      List<int>>(); // contains selected piece and squares where pieces can move
  List<List<int>> get actionBoard => _actionBoard.value;
  set actionBoard(List<List<int>> newValue) => _actionBoard.value = newValue;
  //ACTIONBOARD IS INDEXED AS [ROW][COLUMN]
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

    _resetActions();
  }

  // static final List<List<int>> emptyActions = [

  // ];

  void _resetActions() {
    actionBoard = [
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
      List.filled(8, 0),
    ];
  }

  void cellClicked({required row, required column}) {
    //0 => not selected
    //1 => currently selected piece may move to spot
    //2 => piece is currently selected
    switch (actionBoard[row][column]) {
      case 0:
        if (actionBoard.any((Column) => Column.any(
              (PictureElement) => PictureElement == 2,
            ))) {
          _resetActions();
        }
        final List<List<int>> newBoard = List<List<int>>.from(actionBoard);
        print("Click on ID:${board[column][row]}");
        print("[$board]");
        newBoard[row][column] = 2;
        actionBoard = newBoard;
        //TODO: updateMovable(row, column);
        break;
      case 1:
        //TODO: move piece method here
        break;
      case 2:
        _resetActions();
        break;
    }
    switch (board[column][row]) {
      case 0:
        var newBoard = List<List<int>>.from(actionBoard);
        newBoard[row][column] = 1;
        actionBoard = newBoard;
    }
    update();
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
