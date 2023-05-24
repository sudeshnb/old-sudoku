import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sudoku02/core/size/size_config.dart';

class SecondaryButton extends StatelessWidget {
  final Function()? onTap;
  final String? label;
  final int? count;
  final String assetName;
  SecondaryButton({
    this.onTap,
    this.label,
    required this.assetName,
    this.count,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        // color: Colors.green,
        padding: EdgeInsets.symmetric(
            horizontal: 0.6 * SizeConfig.heightMultiplier!,
            vertical: 0.5 * SizeConfig.heightMultiplier!),
        width: count != null ? 10 * SizeConfig.heightMultiplier! : null,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    assetName,
                    color: theme.buttonColor,
                    width: 2.8 * SizeConfig.heightMultiplier!,
                  ),
                  if (label != null)
                    SizedBox(
                      height: 0.5 * SizeConfig.heightMultiplier!,
                    ),
                  if (label != null)
                    Text(
                      label!,
                      style: theme.textTheme.headline6,
                    ),
                ],
              ),
            ),
            if (count != null)
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 1.2 * SizeConfig.heightMultiplier!,
                  backgroundColor: theme.focusColor,
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
