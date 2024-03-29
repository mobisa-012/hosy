import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosy/core/const/colors.dart';

class FitnessLoading extends StatelessWidget {
  const FitnessLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.textColor,
      child: Center(
        child: Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData (
              brightness: Brightness.dark),
            ), 
            child: const CupertinoActivityIndicator(
              radius: 17,
            )),
      ),
    );
  }
}