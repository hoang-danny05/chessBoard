// ignore_for_file: prefer_final_fields

import 'dart:js_util';

import 'package:chess_board/widgets/cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>(); // board that contains pieces
  List<List<int>> get board => _board.value;
  set board(List<List<int>> setValue) => _board.value = setValue;
  //BOARD IS INDEXED AS [ROW][COLUMN]
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

  void updateActions(
      {required final int row,
      required final int column,
      required final List<List<int>> newActions}) {
    switch (board[row][column]) {
      //Moving rules are here.
      case 0:
        print("empty square selected...");
        break;
      case 6:
        print("pawn selected");
        _updatePawnAction(
            row: row, column: column, newActions: newActions, isWhite: true);
        break;
      case 12:
        newActions[row - 1][column] == 1;
        _updatePawnAction(
            row: row, column: column, newActions: newActions, isWhite: false);
        break;
      default:
        print("Piece at row $row and column $column selected.");
    }
  }

  void cellClicked({required row, required column}) {
    //0 => not selected
    //1 => currently selected piece may move to spot
    //2 => piece is currently selected
    // print("Click on ID:${board[column][row]}");
    // board.forEach((element) {
    //   print(element);
    // });
    // print("ACTIONS:");
    // actionBoard.forEach((element) {
    //   print(element);
    // });
    switch (actionBoard[row][column]) {
      case 0:
        if (actionBoard.any((column) => column.any(
              // check for any selected elements, reset if true
              (cellAction) => cellAction == 2,
            ))) {
          _resetActions();
        }
        //copies actions to reassign later
        final List<List<int>> newActions = List<List<int>>.from(actionBoard);
        newActions[row][column] = 2;
        //TODO: updateMovable(row, column, newActions);
        updateActions(row: row, column: column, newActions: newActions);
        actionBoard = newActions;
        break;
      case 1:
        //TODO: move piece method here
        //find selected piece
        int rowFrom = 0;
        int columnFrom = 0;
        for (; rowFrom < 8; rowFrom++) {
          if (actionBoard[rowFrom].contains(2)) {
            columnFrom = actionBoard[rowFrom].indexOf(2);
            break;
          }
        }
        //copy old board
        var newBoard = List<List<int>>.from(board);
        //set clicked space to the selected place piece
        newBoard[row][column] = newBoard[rowFrom][columnFrom];
        //remove previus position of the piece
        newBoard[rowFrom][columnFrom] = 0;
        board = newBoard;
        _resetActions();
        break;
      case 2:
        _resetActions();

        break;
    }
    switch (board[row][column]) {
      case 0:
        var newBoard = List<List<int>>.from(actionBoard);
        newBoard[row][column] = 0;
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

  void _updatePawnAction({
    required final int row,
    required final int column,
    required List<List<int>> newActions,
    required final bool isWhite,
  }) {
    final int modifier = isWhite ? 1 : -1;
    // check for movement (not taking pieces)
    if (board[row + 1 * modifier][column] == 0) {
      newActions[row + 1 * modifier][column] = 1;
      if ((row == 1 && isWhite) ||
          (row == 6 && !isWhite) && board[row + 2 * modifier][column] == 0) {
        newActions[row + 2 * modifier][column] = 1;
      }
    }
    // check for takable pieces
    if (board[row + 1 * modifier][column + 1] != 0) {
      newActions[row + 1 * modifier][column + 1] = 1;
    }
    if (board[row + 1 * modifier][column - 1] != 0) {
      newActions[row + 1 * modifier][column - 1] = 1;
    }
  }
}
