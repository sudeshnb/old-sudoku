import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sudoku02/components/sudoku_grid.dart';
import 'package:sudoku02/core/Theme/Styles.dart';
import 'package:sudoku02/core/Theme/provider.dart';
import 'package:sudoku02/core/size/size_config.dart';
import 'package:sudoku02/l10n/l10n.dart';
import 'package:sudoku02/pages/getData.dart';
import 'package:sudoku02/pages/splash_page.dart';
import 'package:sudoku02/provider/difficulty/difficulty_provider.dart';
import 'package:sudoku02/provider/level/level_provider.dart';
import 'package:sudoku02/provider/locale_provider.dart';
import 'package:sudoku02/provider/numberProvider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SudokuApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _SudokuAppState createState() => _SudokuAppState();
}

class _SudokuAppState extends State<SudokuApp> {
  DarkThemeProvider themeProvider = new DarkThemeProvider();
  LocaleProvider localeProvider = new LocaleProvider();
  LevelProvider levelProvider = new LevelProvider();
  DifficultyProvider difficultyProvider = new DifficultyProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    getCurrentLevelAndDifficulty();
    getCurrentAppLanguage();
    super.initState();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreference.getTheme();
  }

  void getCurrentAppLanguage() async {
    localeProvider.getLanguages =
        await localeProvider.languagePreference.getLanguage();
  }

  void getCurrentLevelAndDifficulty() async {
    difficultyProvider.getDifficulty =
        await difficultyProvider.difficultyPre.getDifficulty();

    levelProvider.getLevel = await levelProvider.levelPre.getLevel();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeProvider; //get theme
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return localeProvider; //get language
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return levelProvider; //current level
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return difficultyProvider; //current difficulty
          },
        ),
        ChangeNotifierProvider<NumberProvider>(
          create: (_) => NumberProvider(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, value, child) {
        return ChangeNotifierProvider<SudokuGrid>(
          create: (context) => SudokuGrid.blank(),
          child:
              Consumer<LocaleProvider>(builder: (context, localeChange, child) {
            return Consumer<LevelProvider>(
                builder: (context, levelChange, child) {
              return Consumer<DifficultyProvider>(
                  builder: (context, diffiChange, child) {
                return LayoutBuilder(builder: (context, layout) {
                  return OrientationBuilder(builder: (context, orientation) {
                    SizeConfig().init(layout, orientation);
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      locale: Language.localeData(localeProvider.getLanguages),
                      supportedLocales: L10n.all,
                      localizationsDelegates: [
                        // AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      title: 'Sudoku App',
                      theme: Styles.themeData(
                        themeProvider.darkTheme,
                        context,
                      ),
                      // home: SplashPage(),
                      home: Scaffold(),
                    );
                  });
                });
              });
            });
          }),
        );
      }),
    );
  }
}
