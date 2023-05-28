import 'dart:async';
import 'dart:io';

import 'package:vscode_flutter/src/domain/file_item.dart';

class EditorUtils {
  static void mapFileItems(FileItem fileItem) {
    try {
      if (fileItem.isDirectory && fileItem.directory!.existsSync()) {
        Directory directory = fileItem.directory!;

        directory.listSync().forEach((fileSytemEntity) {
          if (fileSytemEntity is File) {
            fileItem.addChildern(FileItem(file: fileSytemEntity));
          }
          if (fileSytemEntity is Directory) {
            FileItem tempDir = FileItem(directory: fileSytemEntity);
            fileItem.addChildern(tempDir);
            mapFileItems(tempDir);
          }
        });
      }
    } catch (e) {
      // Avoiding error at the directory level
      print(e);
    }
  }
}
