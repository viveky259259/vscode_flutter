// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'navigation.dart';

abstract class _$AppNavigator extends RootStackRouter {
  // ignore: unused_element
  _$AppNavigator({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPage(),
      );
    },
    EditorRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EditorRouteArgs>(
          orElse: () => EditorRouteArgs(
              filePickerResult: pathParams.get('filePickerResult')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditorPage(
          directoryPath: args.filePickerResult,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditorPage]
class EditorRoute extends PageRouteInfo<EditorRouteArgs> {
  EditorRoute({
    required dynamic filePickerResult,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditorRoute.name,
          args: EditorRouteArgs(
            filePickerResult: filePickerResult,
            key: key,
          ),
          rawPathParams: {'filePickerResult': filePickerResult},
          initialChildren: children,
        );

  static const String name = 'EditorRoute';

  static const PageInfo<EditorRouteArgs> page = PageInfo<EditorRouteArgs>(name);
}

class EditorRouteArgs {
  const EditorRouteArgs({
    required this.filePickerResult,
    this.key,
  });

  final dynamic filePickerResult;

  final Key? key;

  @override
  String toString() {
    return 'EditorRouteArgs{filePickerResult: $filePickerResult, key: $key}';
  }
}
