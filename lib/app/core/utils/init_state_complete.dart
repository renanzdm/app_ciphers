import 'package:flutter/material.dart';

mixin InitStateComplete<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async => completeInitState());
    super.initState();
  }

  void completeInitState();
}
