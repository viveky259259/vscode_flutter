import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/navigation/navigation.dart';
import 'package:path_provider/path_provider.dart' as p;

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Landing Page')),
      body: Column(children: [
        ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.getDirectoryPath();
              print(result);
                if (result != null) {
                context.router.push(EditorRoute(filePickerResult: result));
              }
          
            },
            child: Text('Open Folder')),
        ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null) {
                context.router.push(EditorRoute(filePickerResult: result));
              }
            },
            child: Text('Open File')),
      ]),
    );
  }
}
