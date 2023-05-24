// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sudoku02/core/Theme/provider.dart';
// import 'package:sudoku02/database/notes_database.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:sudoku02/provider/difficulty/difficulty_provider.dart';
// import 'package:sudoku02/provider/locale_provider.dart';
// import 'package:sudoku02/widgets/Difficulty_bottom_sheet.dart.dart';
// import 'package:sudoku02/widgets/dialog_box.dart';
// import 'package:sudoku02/widgets/help_bottom_sheet.dart';
// import 'package:sudoku02/widgets/language_bottom_sheet.dart';

// class SettingsPage extends StatefulWidget {
//   final int dLevel;
//   final Function() onReset;
//   final Function(int) onDifficul;
//   const SettingsPage(
//       {Key? key,
//       required this.onDifficul,
//       required this.onReset,
//       required this.dLevel})
//       : super(key: key);

//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   late String difficulty = 'Easy';
//   late int difficultyValue;
//   late String language = 'English';
//   late String languageValue = 'en';

//   void onChangedsDifficulty({required int value, required String title}) async {
//     // final proLevel = Provider.of<NumberProvider>(context, listen: false);
//     final diffiChange = Provider.of<DifficultyProvider>(context, listen: false);

//     final SharedPreferences prefs = await _prefs;
//     setState(() {
//       difficulty = title;
//       //difficultyValue = value;
//       difficultyValue = diffiChange.getDifficulty;
//       // proLevel.number = difficultyValue;
//     });

//     prefs.setInt("level", difficultyValue);
//   }

//   void onChangedsLanguage({required String value, required String title}) {
//     setState(() {
//       language = title;
//       languageValue = value;
//     });
//   }

//   @override
//   void initState() {
//     difficultyValue = widget.dLevel;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
//     // final diffiChange = Provider.of<DifficultyProvider>(context, listen: false);

//     final nameC = themeChange.darkTheme;
//     final ln = AppLocalizations.of(context);
//     final theme = Theme.of(context);
//     return Wrap(
//       children: [
//         Container(
//           //height: MediaQuery.of(context).size.height * 0.6,
//           padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
//           child: Container(
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: theme.cardColor,
//             ),
//             child: Column(
//               children: [
//                 SettingsTile(
//                   header: ln!.difficulty,
//                   onPress: () {
//                     showModalBottomSheet(
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return DifficultyBottomSheet(
//                           onDifficul: widget.onDifficul,
//                           val: difficultyValue,
//                           onChangeds: onChangedsDifficulty,
//                         );
//                       },
//                     );
//                   },
//                   child: Text(difficultyValue == 40
//                       ? ln.medium
//                       : difficultyValue == 23
//                           ? ln.expert
//                           : ln.easy),
//                 ),
//                 SettingsTile(
//                   header: nameC ? ln.light : ln.dark,
//                   onPress: () {},
//                   child: Transform.scale(
//                     scale: 0.8,
//                     child: CupertinoSwitch(
//                         value: themeChange.darkTheme,
//                         onChanged: (bool value) {
//                           setState(() {
//                             themeChange.darkTheme = value;
//                           });
//                         }),
//                   ),
//                 ),
//                 SettingsTile(
//                   header: ln.language,
//                   onPress: () {
//                     showModalBottomSheet(
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return LanguageBottomSheet(
//                           onChangeds: onChangedsLanguage,
//                         );
//                       },
//                     );
//                   },
//                   child: Text(ln.english),
//                 ),
//                 SettingsTile(
//                   header: ln.reset,
//                   onPress: () async {
//                     clearDataStore(context);
//                   },
//                 ),
//                 SettingsTile(
//                   header: ln.help,
//                   onPress: () {
//                     showModalBottomSheet(
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       builder: (BuildContext context) {
//                         return HelpBottomSheet();
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> clearDataStore(BuildContext context) async {
//     final confirmed = await showConfirmationDialog(
//       context,
//       title: "Hard Reset",
//       content:
//           "You are about to reset all the application data. This action cannot be undone.",
//       image: 'assets/warning.png',
//     );

//     if (confirmed) {
//       hardReset();
//       Navigator.pop(context);
//     }
//   }

//   void hardReset() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);
//     final languageChange = Provider.of<LocaleProvider>(context, listen: false);
//     await SudokuDatabase.instance.delete();
//     preferences.clear();
//     setState(() {
//       widget.onReset();
//       themeChange.darkTheme = false;
//       languageChange.getLanguages = 'en';
//     });
//   }
// }

// class SettingsTile extends StatelessWidget {
//   final String header;
//   final Widget? child;
//   final Function() onPress;
//   const SettingsTile(
//       {Key? key, required this.onPress, required this.header, this.child})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       height: 60,
//       padding: EdgeInsets.symmetric(horizontal: 40),
//       color: theme.cardColor,
//       child: InkWell(
//         splashColor: Colors.transparent,
//         onTap: onPress,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '$header ',
//               style: theme.textTheme.headline2,
//             ),
//             child == null ? SizedBox() : child!
//           ],
//         ),
//       ),
//     );
//   }
// }
