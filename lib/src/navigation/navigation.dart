import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/features/landing_page/landing_page.dart';
import 'package:vscode_flutter/src/features/editor/editor.dart';
part 'navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppNavigator extends _$AppNavigator {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page, initial: true),
        AutoRoute(page: EditorRoute.page),
      ];
}
