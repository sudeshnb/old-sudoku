// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sudoku02/components/sudoku_grid.dart';
// import 'package:sudoku02/core/size/size_config.dart';
// import 'package:sudoku02/provider/difficulty/difficulty_provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class DifficultyBottomSheet extends StatefulWidget {
//   final int val;
//   final Function({required int value, required String title}) onChangeds;
//   final Function(int) onDifficul;
//   const DifficultyBottomSheet(
//       {Key? key,
//       required this.onDifficul,
//       required this.onChangeds,
//       required this.val})
//       : super(key: key);

//   @override
//   _DifficultyBottomSheetState createState() => _DifficultyBottomSheetState();
// }

// class _DifficultyBottomSheetState extends State<DifficultyBottomSheet> {
//   late int _value;

//   @override
//   void initState() {
//     setState(() {
//       _value = widget.val == 0 ? 57 : widget.val;
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ln = AppLocalizations.of(context);
//     final theme = Theme.of(context);
//     return Container(
//       height: 30 * SizeConfig.heightMultiplier!,
//       padding: EdgeInsets.symmetric(
//         vertical: 2.5 * SizeConfig.heightMultiplier!,
//         horizontal: 2.5 * SizeConfig.heightMultiplier!,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: theme.cardColor,
//       ),
//       child: Column(
//         children: [
//           newRadioTile(context, ln!.easy, 57),
//           newRadioTile(context, ln.medium, 40),
//           newRadioTile(context, ln.expert, 23),
//         ],
//       ),
//     );
//   }

//   ListTile newRadioTile(BuildContext context, String title, int value) {
//     final theme = Theme.of(context);
//     final diffiChange = Provider.of<DifficultyProvider>(context, listen: false);
//     return ListTile(
//       title: Text(
//         title,
//         style: theme.textTheme.subtitle1,
//       ),
//       leading: Radio(
//         value: value,
//         groupValue: diffiChange.getDifficulty,
//         activeColor: theme.accentColor,
//         onChanged: (int? value) {
//           setState(() {
//             _value = value!;

//             widget.onChangeds(value: _value, title: title);
//             diffiChange.getDifficulty = value;
//             widget.onDifficul(value);
//           });

//           Provider.of<SudokuGrid>(context, listen: false).resetBoard();
//           Navigator.of(context).pop();
//         },
//       ),
//     );
//   }
// }
