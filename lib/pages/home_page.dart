// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sudoku02/components/board_square.dart';
// import 'package:sudoku02/components/sudoku_grid.dart';
// import 'package:sudoku02/core/admob/ad_helper.dart';
// import 'package:sudoku02/core/size/size_config.dart';
// import 'package:sudoku02/database/notes_database.dart';
// import 'package:sudoku02/models/sudoku.dart';
// import 'package:sudoku02/models/sudoku_models.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:sudoku02/widgets/appBar.dart';
// import 'package:sudoku02/widgets/dialog_box.dart';
// import 'package:sudoku02/widgets/keypad.dart';
// import 'package:sudoku02/widgets/secondary_button.dart';
// import 'package:sudoku02/widgets/sudoku_cell.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key, required this.title, required this.level})
//       : super(key: key);
//   final int? title;
//   final int? level;

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// const int maxFailedLoadAttempts = 3;

// class _HomePageState extends State<HomePage> {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//   final interval = const Duration(seconds: 1);
//   late Future<int> diffic;
//   late int _level;
//   List _sudoku = [], _sudokuSovld = [], _sudokuAnswer = [];
//   late String _sudokuString;
//   bool isSovld = false;

//   late int difficaltylevel;
//   int currentSeconds = 0;
//   late Timer _timer;
//   @override
//   void initState() {
//     super.initState();
//     _createRewardedAd();
//     if (widget.title != 1000) {
//       getOtherData();
//       _sudokuGet();
//       startTimeout();
//     } else {
//       completeAllGame(context);
//     }
//   }

//   String get timerText =>
//       '${((currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((currentSeconds) % 60).toString().padLeft(2, '0')}';
//   void startTimeout() {
//     var duration = interval;
//     _timer = Timer.periodic(duration, (timer) {
//       setState(() {
//         currentSeconds = timer.tick;
//       });
//     });
//   }

//   RewardedAd? _rewardedAd;
//   int _numRewardedLoadAttempts = 0;

//   void _createRewardedAd() {
//     RewardedAd.load(
//         adUnitId: AdHelper.rewardedAdUnitId,
//         request: AdRequest(),
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd ad) {
//             print('$ad loaded.');
//             _rewardedAd = ad;
//             _numRewardedLoadAttempts = 0;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedAd failed to load: $error');
//             _rewardedAd = null;
//             _numRewardedLoadAttempts += 1;
//             if (_numRewardedLoadAttempts <= maxFailedLoadAttempts) {
//               _createRewardedAd();
//             }
//           },
//         ));
//   }

//   void _showRewardedAd() {
//     if (_rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         _createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         _createRewardedAd();
//       },
//     );

//     _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
//       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
//     });
//     _rewardedAd = null;
//   }

//   @override
//   void dispose() {
//     _rewardedAd?.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   void getNewGame() {
//     setState(() {
//       if (_level != 1000) {
//         _level++;
//         _incrementCounter();
//         helpCount = 3;
//         context.read<SudokuGrid>().resetBoard();
//         _sudokuGet();
//         _timer.cancel();
//         startTimeout();
//       } else {
//         completeAllGame(context);
//       }
//     });
//   }

//   Future<void> _incrementCounter() async {
//     final SharedPreferences prefs = await _prefs;
//     final int counter = (prefs.getInt('counter') ?? 0) + 1;

//     setState(() {
//       diffic = prefs.setInt("counter", counter).then((bool success) {
//         return counter;
//       });
//     });
//   }

//   void getOtherData() async {
//     setState(() {
//       widget.level == 0
//           ? difficaltylevel = 57
//           : difficaltylevel = widget.level!;
//       _level = widget.title!;
//     });
//   }

//   void resetData() {
//     setState(() {
//       _level = 0;
//       difficaltylevel = 57;
//       helpCount = 3;
//     });
//     context.read<SudokuGrid>().resetBoard();
//     _sudokuGet();
//     _timer.cancel();
//     startTimeout();
//   }

//   void resetDifficulty(int val) {
//     setState(() {
//       difficaltylevel = val;
//       helpCount = 3;
//     });
//     context.read<SudokuGrid>().resetBoard();
//     _sudokuGet();
//     _timer.cancel();
//     startTimeout();
//   }

//   void _sudokuGet() async {
//     _sudokuString = sudokuModel[_level];
//     xC = 9;
//     yC = 9;

//     _sudoku = List.generate(
//       9,
//       (i) => List.generate(
//         9,
//         (j) => "e" + (_sudokuString.substring(i * 9, (i + 1) * 9).split('')[j]),
//       ),
//     );
//     _sudokuSovld = List.generate(
//       9,
//       (i) => List.generate(
//         9,
//         (j) => "e" + (_sudokuString.substring(i * 9, (i + 1) * 9).split('')[j]),
//       ),
//     );

//     _sudokuAnswer = List.generate(
//       9,
//       (i) => List.generate(
//         9,
//         (j) =>
//             int.parse(_sudokuString.substring(i * 9, (i + 1) * 9).split('')[j]),
//       ),
//     );

//     int i = 0;

//     while (i < 81 - difficaltylevel) {
//       int x = Random().nextInt(9);
//       int y = Random().nextInt(9);

//       if (_sudoku[x][y] != '0') {
//         setState(() {
//           _sudoku[x][y] = '0';
//           _sudokuAnswer[x][y] = 0;
//           i++;
//         });
//       }
//     }
//   }

//   void answerGet() {
//     int count = 0;
//     for (int k = 0; k < 9; k++) {
//       for (int j = 0; j < 9; j++) {
//         final String val = _sudokuSovld[k][j];
//         final int value =
//             int.parse(val.startsWith('e') ? val.substring(1) : val);
//         if (value == _sudokuAnswer[k][j]) {
//           if (count == 80) {
//             completeGame(context);
//             setState(() {
//               _timer.cancel();
//             });
//           }
//           count++;
//         }
//       }
//     }
//   }

//   getHint() {
//     int count = 81;
//     for (int k = 0; k < 9; k++) {
//       for (int j = 0; j < 9; j++) {
//         if (0 != _sudokuAnswer[k][j]) {
//           count--;
//         }
//         if (count == 0) {
//           isSovld = true;
//         }
//       }
//     }
//   }

//   restart() {
//     for (int k = 0; k < 9; k++) {
//       for (int j = 0; j < 9; j++) {
//         final String val = _sudokuSovld[k][j];
//         final int value = int.parse(val.substring(1));
//         if (value != _sudokuAnswer[k][j]) {
//           _sudokuAnswer[k][j] = 0;
//         }
//       }
//     }
//   }

//   Future<void> completeGame(BuildContext context) async {
//     final confirmed = await showConfirmationDialog(
//       context,
//       title: "Puzzle Completed !",
//       content: "If you want to go next level ? click confirm.",
//       image: 'assets/done.png',
//     );

//     if (confirmed) {
//       _showRewardedAd();
//       addSudokuToDB();
//       getNewGame();
//     }
//   }

//   Future<void> completeAllGame(BuildContext context) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     final confirmed = await showConfirmationDialog(
//       context,
//       title: "Completed All Puzzle !",
//       content: "If you want to start with level 1 ? click confirm to reset.",
//       image: 'assets/done.png',
//     );

//     if (confirmed) {
//       _showRewardedAd();
//       resetData();
//       await SudokuDatabase.instance.delete();
//       preferences.clear();
//     }
//   }

//   int view = 0;
//   void helpingFun() {
//     for (int k = 0; k < 9; k++) {
//       for (int j = 0; j < 9; j++) {
//         if (_sudokuSovld[k][j] != _sudokuAnswer[k][j]) {
//           if (view == 1)
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Container(
//                 height: 50,
//                 child: Text(
//                   '${AppLocalizations.of(context)!.answeris} : ${_sudokuSovld[k][j]}',
//                   style: TextStyle(fontSize: 22),
//                 ),
//               ),
//               backgroundColor: Colors.green.shade400,
//             ));
//           setState(() {
//             view = 0;
//           });
//         }
//       }
//     }
//   }

//   Future addSudokuToDB() async {
//     final sudoku = Sudoku(
//       level: _level + 1,
//       time: timerText,
//       sudokustring: difficaltylevel == 57
//           ? 'Easy'
//           : difficaltylevel == 23
//               ? 'Expert'
//               : 'Medium',
//       isImportant: true,
//       createdTime: DateTime.now(),
//     );

//     await SudokuDatabase.instance.create(sudoku);
//   }

//   int xC = 9;
//   int yC = 9;
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final ln = AppLocalizations.of(context);
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         backgroundColor: theme.scaffoldBackgroundColor,
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomAppBar(
//                   level: (_level + 1).toString(),
//                   type: difficaltylevel,
//                   onReset: resetData,
//                   onDifficul: resetDifficulty,
//                 ),
//                 AspectRatio(
//                   aspectRatio: 1,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: theme.cardColor,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(15),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: theme.shadowColor.withOpacity(0.3),
//                           offset: Offset(0, 12),
//                           blurRadius: 12,
//                           spreadRadius: 5,
//                         ),
//                       ],
//                     ),
//                     padding: EdgeInsets.all(10.0),
//                     margin: EdgeInsets.all(8.0),
//                     child: Container(
//                       color: theme.backgroundColor,
//                       padding: EdgeInsets.all(1.0),
//                       child: Column(
//                         children: <Widget>[
//                           for (int x = 0; x < 9; x++)
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Expanded(
//                                     child: Row(
//                                       children: [
//                                         for (int y = 0; y < 9; y++)
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: ChangeNotifierProvider<
//                                                       BoardSquare>.value(
//                                                     value: context
//                                                         .watch<SudokuGrid>()
//                                                         .userBoard[x][y],
//                                                     child: Container(
//                                                       margin:
//                                                           EdgeInsets.all(0.3),
//                                                       color: xC == x && yC == y
//                                                           ? theme
//                                                               .unselectedWidgetColor
//                                                           : theme.cardColor,
//                                                       child: SudokuCell(
//                                                         isValue: _sudoku[x][y],
//                                                         isSovld: isSovld,
//                                                         sudokuSovld:
//                                                             _sudokuSovld[x][y],
//                                                         sudokuAnswer:
//                                                             _sudokuAnswer[x][y],
//                                                         callBack: () {
//                                                           setState(() {
//                                                             isSovld = false;
//                                                             _sudokuAnswer[x]
//                                                                     [y] =
//                                                                 keyPadeValue;
//                                                             answerGet();
//                                                             xC = x;
//                                                             yC = y;
//                                                           });
//                                                         },
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 //  Row padding
//                                                 if (y == 2 || y == 5)
//                                                   SizedBox(width: 1.2),
//                                               ],
//                                             ),
//                                           )
//                                       ],
//                                     ),
//                                   ),
//                                   //  Column padding
//                                   if (x == 2 || x == 5) SizedBox(height: 1.2),
//                                 ],
//                               ),
//                             )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 //  key pade design
//                 SizedBox(
//                   height: 4 * SizeConfig.heightMultiplier!,
//                 ),
//                 Container(
//                   height: 30 * SizeConfig.heightMultiplier!,
//                   color: theme.scaffoldBackgroundColor,
//                   child: Column(
//                     children: [
//                       KeyPad(callback: callBack),
//                       SizedBox(
//                         height: 4 * SizeConfig.heightMultiplier!,
//                       ),
//                       Container(
//                         height: 10 * SizeConfig.heightMultiplier!,
//                         padding: EdgeInsets.only(
//                             bottom: 1 * SizeConfig.heightMultiplier!,
//                             right: 1 * SizeConfig.heightMultiplier!,
//                             left: 1 * SizeConfig.heightMultiplier!),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SecondaryButton(
//                               onTap: () {
//                                 setState(() {
//                                   restart();
//                                   context.read<SudokuGrid>().resetBoard();
//                                   isSovld = false;
//                                   _timer.cancel();
//                                   startTimeout();
//                                 });
//                               },
//                               label: ln!.reset,
//                               assetName: 'assets/undo.svg',
//                             ),
//                             SecondaryButton(
//                               onTap: getHint,
//                               label: ln.solve,
//                               assetName: 'assets/solve.svg',
//                             ),
//                             SecondaryButton(
//                               onTap: () {
//                                 setState(() {
//                                   helpCount = 3;
//                                   context.read<SudokuGrid>().resetBoard();
//                                   _sudokuGet();
//                                   _timer.cancel();
//                                   startTimeout();
//                                 });
//                               },
//                               label: ln.newGame,
//                               assetName: 'assets/add.svg',
//                             ),
//                             SecondaryButton(
//                               onTap: helpCount > 0
//                                   ? () {
//                                       if (xC != 9) {
//                                         setState(() {
//                                           _sudoku[xC][yC] =
//                                               _sudokuSovld[xC][yC];
//                                           final String value =
//                                               _sudokuSovld[xC][yC];
//                                           _sudokuAnswer[xC][yC] =
//                                               int.parse(value.substring(1));

//                                           helpCount--;

//                                           context
//                                               .read<SudokuGrid>()
//                                               .updateSelectedNumber(0);
//                                           answerGet();
//                                         });
//                                       }
//                                     }
//                                   : null,
//                               label: ln.help,
//                               assetName: 'assets/lightbulb.svg',
//                               count: helpCount,
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   int helpCount = 3;
//   int keyPadeValue = 0;
//   void callBack(int count) {
//     setState(() {
//       keyPadeValue = count;
//     });
//   }
// }
