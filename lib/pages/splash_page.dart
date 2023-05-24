// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:sudoku02/core/size/size_config.dart';
// import 'package:sudoku02/pages/getData.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   void initState() {
//     Timer(Duration(milliseconds: 2500), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => GetData()));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ln = AppLocalizations.of(context);
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 29 * SizeConfig.heightMultiplier!,
//           width: 30 * SizeConfig.heightMultiplier!,
//           child: Column(
//             children: [
//               Image.asset('assets/icon.png'),
//               Spacer(),
//               Text(
//                 ln!.splash,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 2.5 * SizeConfig.heightMultiplier!,
//                   fontWeight: FontWeight.w500,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
