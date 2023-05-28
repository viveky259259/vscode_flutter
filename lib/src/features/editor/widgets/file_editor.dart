import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
        content = utf8.decode(tempFile.file!.readAsBytesSync());
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
    return Scaffold(
      body: SingleChildScrollView(child: Text(content)),
    );
  }
}
