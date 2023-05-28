import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:vscode_flutter/src/domain/file_item.dart';

class EditorUtils {
  final resultPort = ReceivePort();
  Future<FileItem> mapFileItems(FileItem fileItem) async {
    return await isolateReading(fileItem);
  }

  void _mapFileItems(FileItem fileItem) {
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
            _mapFileItems(tempDir);
          }
        });
      }
    } catch (e) {
      // Avoiding error at the directory level
      print(e);
    }
    Isolate.exit(resultPort.sendPort, fileItem);
  }

  Future<FileItem> isolateReading(FileItem fileItem) async {
    await Isolate.spawn(_mapFileItems, fileItem, onExit: resultPort.sendPort);

    return await resultPort.first;
  }
}
