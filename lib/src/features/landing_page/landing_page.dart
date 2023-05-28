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
      appBar: AppBar(title: const Text('Landing Page')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Start'),
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () => debugPrint('To implement new file'),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.file_copy),
                  SizedBox(
                    width: 16,
                  ),
                  Text('New file...')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () async {
              final result = await FilePicker.platform.getDirectoryPath();

              if (result != null) {
                context.router.push(EditorRoute(filePickerResult: result));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.file_open),
                  SizedBox(
                    width: 16,
                  ),
                  Text('Open...')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Recent'),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: const [
              Text('Project Name'),
              SizedBox(
                width: 16,
              ),
              Text('Project path')
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(onPressed: () {}, child: const Text('More'))
        ]),
      ),
    );
  }
}
