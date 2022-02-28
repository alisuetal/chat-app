import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tools {
  void toggleWhiteBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFFFFFFF), //Color(0xFFEBEBEB),
      ),
    );
  }

  void toggleGreyBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFEBEBEB), //Color(0xFFEBEBEB),
      ),
    );
  }
}
