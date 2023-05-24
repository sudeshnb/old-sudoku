import 'package:flutter/material.dart';
import 'board_square.dart';
import 'position_model.dart';
import 'package:flutter/foundation.dart';

class SudokuGrid extends ChangeNotifier {
  late List<List<BoardSquare>> userBoard;
  final int width = 9;
  final int height = 9;
  int selectedNumber = 0;
  // Generic constructor
  SudokuGrid({required this.userBoard});

  // Named constructor to build a blank board
  SudokuGrid.blank() {
    this.userBoard = List.generate(
      width,
      (int row) => List.generate(
        height,
        (int column) =>
            BoardSquare(position: Position(x: row, y: column), value: 0),
        growable: false,
      ),
      growable: false,
    );
  }
  // // Helper function to update board if any positions match that of error position
  // void _updateBoardWithErrors(
  //     List<Position> positions, List<List<BoardSquare>> board) {
  //   // Iterate through each board square
  //   for (List<BoardSquare> row in board) {
  //     for (BoardSquare square in row) {
  //       // Update user inputted to true if the square's position object
  //       // matches a position object in the list (thanks Equatable)
  //       if (positions.contains(square.position)) {
  //         square.hasError = true;
  //       }
  //     }
  //   }
  // }
  // Function to check if the board has any blanks. Used to check if board is solved.
  bool hasBlanks(List<List<BoardSquare>> board) {
    bool noBlanks = true;
    // Iterate through the board to see if any value is equal to 0
    // If a 0 is found, it means there is still blank spaces
    for (List<BoardSquare> row in board) {
      noBlanks = row.any((element) => element.value == 0);
    }
    return noBlanks;
  }

  void resetBoard() {
    userBoard.forEach((row) {
      row.forEach((boardSquare) {
        boardSquare.value = 0;
        boardSquare.hasError = false;
        boardSquare.userInputted = false;
      });
    });
    this.selectedNumber = 0;
    notifyListeners();
  }

  void updateSelectedNumber(int newNumber) {
    this.selectedNumber = newNumber;
    notifyListeners();
  }

  String toString() {
    return userBoard[0].toString() +
        '\n' +
        userBoard[1].toString() +
        '\n' +
        userBoard[2].toString() +
        '\n' +
        userBoard[3].toString() +
        '\n' +
        userBoard[4].toString() +
        '\n' +
        userBoard[5].toString() +
        '\n' +
        userBoard[6].toString() +
        '\n' +
        userBoard[7].toString() +
        '\n' +
        userBoard[8].toString();
  }
}
