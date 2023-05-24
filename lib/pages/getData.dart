// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sudoku02/pages/home_page.dart';
// import 'package:sudoku02/provider/difficulty/difficulty_provider.dart';
// import 'package:sudoku02/provider/level/level_provider.dart';

// class GetData extends StatefulWidget {
//   const GetData({Key? key}) : super(key: key);

//   @override
//   _GetDataState createState() => _GetDataState();
// }

// class _GetDataState extends State<GetData> {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   late Future<int> _counter;
//   late Future<int> _level;

//   @override
//   void initState() {
//     super.initState();
//     _counter = _prefs.then((SharedPreferences prefs) {
//       return (prefs.getInt('counter') ?? 0);
//     });
//     _level = _prefs.then((SharedPreferences prefs) {
//       return (prefs.getInt('level') ?? 0);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final diffiChange = Provider.of<DifficultyProvider>(context, listen: false);
//     final levelChange = Provider.of<LevelProvider>(context, listen: false);
//     return FutureBuilder<int>(
//         future: _counter,
//         builder: (context, snapshotCounter) {
//           switch (snapshotCounter.connectionState) {
//             case ConnectionState.waiting:
//               return const CircularProgressIndicator();
//             default:
//               if (snapshotCounter.hasError) {
//                 return Text('Error: ${snapshotCounter.error}');
//               } else {
//                 return FutureBuilder<int>(
//                     future: _level,
//                     builder: (context, snapshot) {
//                       switch (snapshot.connectionState) {
//                         case ConnectionState.waiting:
//                           return const CircularProgressIndicator();
//                         default:
//                           if (snapshot.hasError) {
//                             return Text('Error: ${snapshot.error}');
//                           } else {
//                             return HomePage(
//                               title: levelChange.getLevel,
//                               level: diffiChange.getDifficulty,
//                             );
//                           }
//                       }
//                     });
//               }
//           }
//         });
//   }
// }
