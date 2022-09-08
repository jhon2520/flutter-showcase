import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseView extends StatelessWidget {

  const ShowCaseView({
    Key? key, 
    required this.globalKey, 
    required this.title, 
    required this.description, 
    required this.child, 
    required this.overlayColor, 
    required this.shapeBorder,
    this.titleTextStyle,
  
  }) : super(key: key);

  final GlobalKey globalKey;
  final String title;
  final String description;
  final Widget child;
  final Color overlayColor;
  final ShapeBorder shapeBorder;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      overlayColor: overlayColor,
      key: globalKey,
      title: title,
      description: description,
      shapeBorder: shapeBorder,
      showArrow: true,
      titleTextStyle: titleTextStyle,
      child: child);
  }
}