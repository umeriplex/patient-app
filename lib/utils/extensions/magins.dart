import 'package:flutter/cupertino.dart';

extension AppPadding on double {
  SizedBox get pw => SizedBox(width: this);
  SizedBox get ph => SizedBox(height: this);
}