// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sudoku02/core/size/size_config.dart';
// import 'package:sudoku02/settings_page.dart';
// import 'package:sudoku02/widgets/history_bottom_sheet.dart.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class CustomAppBar extends StatelessWidget {
//   final String level;
//   final int type;
//   final Function() onReset;
//   final Function(int) onDifficul;
//   const CustomAppBar({
//     Key? key,
//     required this.level,
//     required this.type,
//     required this.onReset,
//     required this.onDifficul,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ln = AppLocalizations.of(context);
//     final theme = Theme.of(context);
//     return Container(
//       height: 7 * SizeConfig.heightMultiplier!,
//       padding: EdgeInsets.only(
//           left: 2.5 * SizeConfig.heightMultiplier!,
//           right: 1.5 * SizeConfig.heightMultiplier!),
//       color: theme.scaffoldBackgroundColor,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '${ln!.level} : $level',
//             style: theme.textTheme.headline1,
//           ),
//           Row(
//             children: [
//               InkWell(
//                 splashColor: Colors.transparent,
//                 onTap: () {
//                   showModalBottomSheet(
//                     backgroundColor: Colors.transparent,
//                     context: context,
//                     builder: (BuildContext context) {
//                       return HistoryBottomSheet();
//                     },
//                   );
//                 },
//                 child: SvgPicture.asset('assets/trophy.svg',
//                     height: 3.5 * SizeConfig.heightMultiplier!,
//                     color: theme.buttonColor // Colors.blue[800],
//                     ),
//               ),
//               SizedBox(width: 1.5 * SizeConfig.heightMultiplier!),
//               InkWell(
//                 splashColor: Colors.transparent,
//                 onTap: () {
//                   showModalBottomSheet(
//                     backgroundColor: Colors.transparent,
//                     context: context,
//                     builder: (BuildContext context) {
//                       return SettingsPage(
//                         onReset: onReset,
//                         onDifficul: onDifficul,
//                         dLevel: type,
//                       );
//                     },
//                   );
//                 },
//                 child: Icon(
//                   Icons.more_horiz_outlined,
//                   color: theme.buttonColor,
//                 ),
//               ),
//               SizedBox(width: 1.5 * SizeConfig.heightMultiplier!),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
