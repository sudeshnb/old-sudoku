import 'package:flutter/material.dart';
import 'keypad_cell.dart';

class KeyPad extends StatelessWidget {
  final Function(int) callback;
  static const int rows = 2;
  static const int columns = 5;

  const KeyPad({Key? key, required this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16.0,
      // Reduce vertical spacing if the screen is small
      runSpacing: MediaQuery.of(context).size.height < 620 ? 8.0 : 16.0,
      children: List.generate(
        rows * columns,
        (index) => KeyPadCell(
          callback: callback,
          numberValue: index,
        ),
      ),
    );
  }
}
