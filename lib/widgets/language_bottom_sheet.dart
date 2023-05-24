import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku02/core/size/size_config.dart';
import 'package:sudoku02/provider/locale_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  final Function({required String value, required String title}) onChangeds;
  const LanguageBottomSheet({Key? key, required this.onChangeds})
      : super(key: key);

  @override
  _LanguageBottomSheetState createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  String _value = 'en';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 3 * SizeConfig.heightMultiplier!,
              horizontal: 3 * SizeConfig.heightMultiplier!),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 3 * SizeConfig.heightMultiplier!,
              horizontal: 3 * SizeConfig.heightMultiplier!,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: theme.cardColor,
            ),
            child: Column(
              children: [
                languageListTile(context, 'English', 'en', '🇬🇧'),
                languageListTile(context, 'සිංහල', 'si', '🇱🇰'),
                languageListTile(context, 'العربية', 'ar', '🇸🇦'),
                languageListTile(context, 'हिंदी', 'hi', '🇮🇳'),
                languageListTile(context, 'Deutsch', 'de', '🇩🇪'),
                languageListTile(context, 'Español', 'es', '🇪🇸'),
              ],
            ),
          ),
        )
      ],
    );
  }

  ListTile languageListTile(BuildContext context, String title, String value,
      final String languageEmoji) {
    final languageChange = Provider.of<LocaleProvider>(context, listen: false);
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        title,
        style: theme.textTheme.headline2,
      ),
      leading: Text(
        languageEmoji,
        style: TextStyle(fontSize: 2.8 * SizeConfig.heightMultiplier!),
      ),
      onTap: () async {
        setState(() {
          _value = value;
          widget.onChangeds(value: _value, title: title);
          languageChange.getLanguages = value;
        });
        await Future.delayed(const Duration(milliseconds: 400));

        Navigator.of(context).pop();
      },
    );
  }
}
