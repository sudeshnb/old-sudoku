import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sudoku02/components/sudoku_grid.dart';

class KeyPadCell extends StatelessWidget {
  KeyPadCell({required this.numberValue, required this.callback})
      : assert(numberValue >= 0);
  final int numberValue;
  final Function(int re) callback;

  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        context.watch<SudokuGrid>().selectedNumber == numberValue;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        callback(numberValue);
        context.read<SudokuGrid>().updateSelectedNumber(numberValue);
      },
      child: Container(
        height: width >= 800 ? 60 : 50,
        width: width >= 800 ? 60 : 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white,
          border: Border.all(
            color: Colors.blueAccent,
            width: width >= 800 ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[900]!.withOpacity(0.3),
              offset: Offset(0, 10),
              blurRadius: 12,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: numberValue == 0
              ? SvgPicture.asset(
                  'assets/eraser.svg',
                  color: isSelected ? Colors.white : Colors.blue[900],
                  width: width * 0.06,
                )
              : Text(
                  // Instead of showing the number 0, we want the user to be able to a blank space
                  numberValue.toString(),
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue[900],
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
