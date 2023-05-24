import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku02/components/board_square.dart';
import 'package:sudoku02/components/sudoku_grid.dart';

class SudokuCell extends StatelessWidget {
  final String isValue;
  final bool isSovld;
  final String sudokuSovld;
  final int sudokuAnswer;
  final Function() callBack;
  const SudokuCell({
    Key? key,
    required this.isValue,
    required this.isSovld,
    required this.sudokuSovld,
    required this.sudokuAnswer,
    required this.callBack,
  }) : super(key: key);

  String getCellValue(int cellValue) {
    if (cellValue == 0) {
      return '';
    } else {
      return cellValue.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = context.watch<BoardSquare>().userInputted;
    final value = sudokuSovld.substring(1);
    return InkWell(
      onTap: () {
        // Update the value of the board square based on the current selected number from the keypad
        if (!isValue.startsWith('e')) {
          callBack();
          context
              .read<BoardSquare>()
              .updateValue(context.read<SudokuGrid>().selectedNumber);
        }
      },
      child: Center(
        child: isSovld
            ? Text(
                value == sudokuAnswer.toString()
                    ? value
                    : getCellValue(context.watch<BoardSquare>().value),
                style: theme.textTheme.headline4!.copyWith(
                    color: value == sudokuAnswer.toString()
                        ? theme.highlightColor
                        : Colors.red),
              )
            : Text(
                isValue.startsWith('e')
                    ? isValue.substring(1)
                    : getCellValue(context.watch<BoardSquare>().value),
                style: theme.textTheme.headline4!.copyWith(
                  color: isUser ? theme.hintColor : theme.highlightColor,
                ),
              ),
      ),
    );
  }
}
