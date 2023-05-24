import 'package:flutter/material.dart';
import 'package:sudoku02/core/size/size_config.dart';
import 'package:sudoku02/core/styles/colors.dart';

class UserDialogBox extends StatelessWidget {
  final String title;
  final String descreption;
  final Function() onCancel;
  final Function() onConfirm;
  final String gifPath;
  const UserDialogBox(
      {Key? key,
      required this.title,
      required this.onCancel,
      required this.onConfirm,
      required this.descreption,
      required this.gifPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color cancelColor = Colors.transparent;
    Color okColor = kPrimaryColor;

    var image = ClipRRect(
      child: Image.asset(
        '$gifPath',
        fit: BoxFit.fill,
        height: 10 * SizeConfig.heightMultiplier!,
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 3 * SizeConfig.heightMultiplier!),
          width: 7 * SizeConfig.heightMultiplier!,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: theme.cardColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  title,
                  style: theme.textTheme.headline5,
                ),
              ),
              SizedBox(height: 1.5 * SizeConfig.heightMultiplier!),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Container(
                  child: Text(
                    descreption,
                    style: theme.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 1.5 * SizeConfig.heightMultiplier!),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    customButton('cancel', cancelColor, onCancel, theme, true),
                    SizedBox(
                      width: 1.5 * SizeConfig.heightMultiplier!,
                    ),
                    customButton('ok', okColor, onConfirm, theme, false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(
      String t, Color c, Function() f, ThemeData theme, bool isCancel) {
    return GestureDetector(
      onTap: f,
      child: Container(
        height: 4.5 * SizeConfig.heightMultiplier!,
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: c),
        child: Center(
          child: Text(
            t,
            style: isCancel
                ? theme.textTheme.button!.copyWith(color: Colors.blue)
                : theme.textTheme.button,
          ),
        ),
      ),
    );
  }
}

Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String content,
  required String image,
}) async {
  final bool confirmed = await showDialog(
        context: context,
        builder: (context) {
          return UserDialogBox(
            title: title,
            descreption: content,
            onConfirm: () => Navigator.of(context).pop(true),
            onCancel: () => Navigator.of(context).pop(false),
            gifPath: image,
          );
        },
      ) ??
      false;

  return confirmed;
}
