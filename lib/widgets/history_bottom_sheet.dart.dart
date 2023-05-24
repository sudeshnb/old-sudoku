// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:sudoku02/core/size/size_config.dart';
// import 'package:sudoku02/database/notes_database.dart';
// import 'package:sudoku02/models/sudoku.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class HistoryBottomSheet extends StatefulWidget {
//   const HistoryBottomSheet({Key? key}) : super(key: key);

//   @override
//   _HistoryBottomSheetState createState() => _HistoryBottomSheetState();
// }

// class _HistoryBottomSheetState extends State<HistoryBottomSheet> {
//   late List<Sudoku> sudokus;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();

//     refreshNotes();
//   }

//   Future refreshNotes() async {
//     setState(() => isLoading = true);

//     this.sudokus = await SudokuDatabase.instance.readAllNotes();

//     setState(() => isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     final theme = Theme.of(context);
//     final ln = AppLocalizations.of(context);
//     return Wrap(
//       children: [
//         Container(
//           height: height / 2,
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(
//             vertical: 1.5 * SizeConfig.heightMultiplier!,
//             horizontal: 2 * SizeConfig.heightMultiplier!,
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: theme.cardColor,
//           ),
//           child: isLoading
//               ? CircularProgressIndicator()
//               : sudokus.isEmpty
//                   ? Center(
//                       child: Text(
//                         ln!.noAchiev,
//                         style: theme.textTheme.headline5,
//                       ),
//                     )
//                   : ListView.builder(
//                       physics: BouncingScrollPhysics(),
//                       itemCount: sudokus.length,
//                       itemBuilder: (context, index) {
//                         final sudoku = sudokus[index];
//                         var dateString =
//                             DateFormat('d/MMM/yyy').format(sudoku.createdTime);
//                         return ListTile(
//                           leading: SvgPicture.asset(
//                             'assets/trophy.svg',
//                             height: 4 * SizeConfig.heightMultiplier!,
//                             color: theme.buttonColor,
//                           ),
//                           title: Text(
//                             '${ln!.besttime} : ${sudoku.time} min',
//                             style: theme.textTheme.subtitle1,
//                           ),
//                           subtitle: Row(
//                             children: [
//                               Text(
//                                 '${ln.level} : ${sudoku.level}',
//                                 style: theme.textTheme.subtitle2,
//                               ),
//                               SizedBox(
//                                 width: 0.7 * SizeConfig.heightMultiplier!,
//                               ),
//                               Text(
//                                 '- ${sudoku.sudokustring}',
//                                 style: theme.textTheme.subtitle2,
//                               ),
//                               SizedBox(
//                                   width: 0.7 * SizeConfig.heightMultiplier!),
//                               Text(
//                                 dateString,
//                                 style: theme.textTheme.subtitle2,
//                               )
//                             ],
//                           ),
//                         );
//                       }),
//         ),
//       ],
//     );
//   }
// }
