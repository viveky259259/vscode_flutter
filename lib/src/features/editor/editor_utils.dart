import 'dart:async';
import 'dart:io';

import 'package:vscode_flutter/src/domain/file_item.dart';

class EditorUtils {
  static Future<void> mapFileItems(FileItem fileItem) async {
    Completer<void> completer = Completer();
    try {
      if (fileItem.isDirectory && fileItem.directory!.existsSync()) {
        Directory directory = fileItem.directory!;

        directory.list().listen((fileSytemEntity) async {
          if (fileSytemEntity is File) {
            fileItem.addChildern(FileItem(file: fileSytemEntity));
          }
          if (fileSytemEntity is Directory) {
            FileItem tempDir = FileItem(directory: fileSytemEntity);
            fileItem.addChildern(tempDir);
            await mapFileItems(tempDir);
          }
        }).onDone(() {
          completer.complete();
        });
      }
    } catch (e) {
      // Avoiding error at the directory level
      print(e);
    }

    return completer.future;
  }
}
