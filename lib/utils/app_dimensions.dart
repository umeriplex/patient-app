import 'package:flutter/material.dart';

class AD{
  BuildContext context;
  AD.of(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  double get w10 => screenWidth / 84.4;
  double get w15 => screenWidth / 82.2;
  double get w20 => screenWidth / 56.27;
  double get w24 => screenWidth / 35.16;
  double get w30 => screenWidth / 28.13;
  double get w45 => screenWidth / 18.76;


  double get h10 => screenHeight / 84.4;
  double get h15 => screenHeight / 82.2;
  double get h20 => screenHeight / 56.27;
  double get h24 => screenHeight / 36.16;
  double get h30 => screenHeight / 28.13;
  double get h45 => screenHeight / 18.76;

  double get f20 => screenHeight / 42.2;
  double get f16 => screenHeight / 52.75;
  double get f26 => screenHeight / 32.46;

  double get r7 => screenHeight / 120.57;
  double get r10 => screenHeight / 84.4;
  double get r15 => screenHeight / 56.27;
  double get r20 => screenHeight / 42.2;
  double get r30 => screenHeight / 28.13;

  double get icon24 => screenHeight / 35.17;
  double get icon16 => screenHeight / 52.75;

}