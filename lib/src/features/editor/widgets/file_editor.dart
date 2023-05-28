import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/domain/file_item.dart';

@RoutePage()
class FileEditor extends StatefulWidget {
  const FileEditor({@pathParam required this.file, super.key});
  final dynamic file;

  @override
  State<FileEditor> createState() => _FileEditorState();
}

class _FileEditorState extends State<FileEditor> {
  String content = '';
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startReading();
    });
  }

  void startReading() async {
    if (widget.file is FileItem) {
      final tempFile = widget.file as FileItem;
      if (tempFile.isFile) {
        if (tempFile.file!.uri.pathSegments.last.contains('.dart')) {
          content = utf8.decode(tempFile.file!.readAsBytesSync());
        } else {
          content =
              'This is not a dart file: ${tempFile.file!.uri.pathSegments.last}}';
        }
      } else if (tempFile.isDirectory) {
        content = 'This is a directory';
      } else {
        content = 'I dont know what this is';
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.file is FileItem) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Text(widget.file.file.uri.pathSegments.last),
            Text(content),
          ],
        )),
      );
    } else {
      return SizedBox();
    }
  }
}
