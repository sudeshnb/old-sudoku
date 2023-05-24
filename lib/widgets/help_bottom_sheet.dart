// import 'package:flutter/material.dart';
// import 'package:sudoku02/core/size/size_config.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class HelpBottomSheet extends StatelessWidget {
//   const HelpBottomSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final ln = AppLocalizations.of(context);

//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: 3 * SizeConfig.heightMultiplier!,
//         horizontal: 3 * SizeConfig.heightMultiplier!,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: theme.cardColor,
//       ),
//       child: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           Text(
//             ln!.howtosolve,
//             textAlign: TextAlign.center,
//             style: theme.textTheme.headline1!.copyWith(
//               fontSize: 25,
//             ),
//           ),
//           SizedBox(
//             height: 2 * SizeConfig.heightMultiplier!,
//           ),
//           Text(
//             ln.howtosolvediscr,
//             style: theme.textTheme.bodyText1,
//           ),
//           Image.asset(
//             'assets/sudoku.png',
//           ),
//           SizedBox(
//             height: 2 * SizeConfig.heightMultiplier!,
//           ),
//           Text(
//             ln.row,
//             style: theme.textTheme.headline2,
//           ),
//           SizedBox(
//             height: 1 * SizeConfig.heightMultiplier!,
//           ),
//           Text(
//             ln.rowDis,
//             style: theme.textTheme.bodyText1,
//           ),
//           SizedBox(height: 2 * SizeConfig.heightMultiplier!),
//           Text(
//             ln.column,
//             style: theme.textTheme.headline2,
//           ),
//           SizedBox(height: 1 * SizeConfig.heightMultiplier!),
//           Text(
//             ln.columnDis,
//             style: theme.textTheme.bodyText1,
//           ),
//           SizedBox(height: 2 * SizeConfig.heightMultiplier!),
//           Text(
//             ln.box,
//             style: theme.textTheme.headline2,
//           ),
//           SizedBox(height: 1 * SizeConfig.heightMultiplier!),
//           Text(
//             ln.boxDis,
//             style: theme.textTheme.bodyText1,
//           ),
//           SizedBox(height: 2 * SizeConfig.heightMultiplier!),
//         ],
//       ),
//     );
//   }
// }
