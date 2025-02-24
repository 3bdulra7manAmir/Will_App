import 'package:flutter/material.dart';
import 'package:will_app/Core/constants/app_borders.dart';
import 'package:will_app/Core/utils/styles.dart';

class CustomButton extends StatelessWidget
{
  const CustomButton({
    super.key,

    required this.btnT,

    required this.btnTColor,
    required this.btnBGColor,

    this.btnWidth,
    this.btnHeight,

    required this.btnOnPressed,
    this.borderRadius,
  });

  final String btnT;
  final Color? btnTColor;
  final Color btnBGColor;

  final double? btnWidth;
  final double? btnHeight;

  final void Function()? btnOnPressed;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      height: btnHeight,
      width: btnWidth,

      child: TextButton(style: TextButton.styleFrom(backgroundColor: btnBGColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? AppBorders().radiusCircular16,),
        ),

        onPressed: btnOnPressed,
        child: Text(btnT, style: Styles.textStyle16),
      ),
    );
  }
}
