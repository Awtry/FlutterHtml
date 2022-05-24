import 'package:examen_2p/shared/responsive.dart';
import 'package:examen_2p/utility/global.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final bool? hasColor;
  final bool? otherColor;
  final void Function()? onPressed;
  final Color? color;
  final Color? colorButton;
  final double? width;
  final double? height;
  final double? fontSize;

  const ButtonWidget({
    Key? key,
    this.title,
    this.hasColor,
    this.onPressed,
    this.color,
    this.colorButton = Global.colorAzul,
    this.height = 60.0,
    this.width = -1.0,
    this.fontSize,
    this.otherColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSizeButton = 0;

    if (isTab(context) || isDesktop(context)) {
      fontSizeButton = fontSize ?? 20;
    } else if (isMobile(context)) {
      fontSizeButton = fontSize ?? 14;
    }

    return Material(
      borderRadius: BorderRadius.circular(4.0),
      child: Ink(
        decoration: BoxDecoration(
            color: hasColor!
                ? Global.colorBlanco
                : otherColor!
                    ? colorButton
                    : Global.colorEmpresa,
            borderRadius: BorderRadius.circular(4.0)),
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: onPressed,
          child: SizedBox(
            height: height,
            width: width! < 0 ? MediaQuery.of(context).size.width : width!,
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                    color: hasColor! ? Global.colorNegro : Global.colorBlanco,
                    fontWeight: FontWeight.w400,
                    fontSize: fontSizeButton),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
