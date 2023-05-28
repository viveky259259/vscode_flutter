import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/domain/file_item.dart';
import 'package:vscode_flutter/src/features/editor/widgets/file_editor.dart';
import 'package:vscode_flutter/src/features/editor/widgets/file_name.dart';

@RoutePage()
class EditorPage extends StatefulWidget {
  EditorPage({@pathParam required this.directoryPath, super.key});
  final String directoryPath;

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  FileItem? selectedFile;
  FileItem? fileItem;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      startReading();
    });
  }

  void startReading() async {
    Directory directory = Directory(widget.directoryPath);
    FileItem fileItem = FileItem(directory: directory);
    getFiles(fileItem);
    setState(() {
      this.fileItem = fileItem;
    });
  }

  void getFiles(FileItem fileItem) {
    if (fileItem.isDirectory && fileItem.directory!.existsSync()) {
      Directory directory = fileItem.directory!;
      directory.listSync().forEach((element) {
        if (element is File) {
          fileItem.addChildern(FileItem(file: element));
        }
        if (element is Directory) {
          FileItem tempDir = FileItem(directory: element);
          fileItem.addChildern(tempDir);
          getFiles(tempDir);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: selectedFile != null
              ? const Center(
                  child: Text('Nothing to show'),
                )
              : ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                      onTap: () => setState(() {
                            selectedFile = fileItem?.childItems?[index];
                          }),
                      child: FileName(
                        fileItem: fileItem?.childItems?[index] ?? FileItem(),
                      )),
                  itemCount: fileItem?.childItems?.length,
                ),
        ),
        Expanded(
            child: selectedFile != null
                ? FileEditor(file: selectedFile)
                : Text('Select a file to edit'))
      ],
    ));
  }
}
