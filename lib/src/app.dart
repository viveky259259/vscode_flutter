import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/navigation/navigation.dart';

class VsCodeApp extends StatelessWidget {
  const VsCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appNavigator = AppNavigator();
    return MaterialApp.router(
      routerConfig: appNavigator.config(),
    );
  }
}
