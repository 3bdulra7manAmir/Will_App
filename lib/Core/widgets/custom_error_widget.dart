import 'package:flutter/material.dart';
import 'package:will_app/Core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget
{
  const CustomErrorWidget({super.key, required this.errorMessage,});

  final String errorMessage;

  @override
  Widget build(BuildContext context)
  {
    return Center(child:  Text(errorMessage, style: Styles.textStyle16, textAlign: TextAlign.center,));
  }
}