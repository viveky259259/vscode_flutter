import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/domain/file_item.dart';

class FileName extends StatelessWidget {
  const FileName({required this.fileItem, super.key});
  final FileItem fileItem;

  @override
  Widget build(BuildContext context) {
    if (fileItem.file != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/logo/dart_logo.png',
            fit: BoxFit.fill,
            height: 16,
            width: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(fileItem.file!.uri.pathSegments.last),
        ],
      );
    } else if (fileItem.directory != null) {
      return Row(
        children: [
          const Icon(Icons.arrow_right),
          const SizedBox(
            width: 8,
          ),
          Text(fileItem.directory!.path.split('/').last),
        ],
      );
    }
    return const Text('Not able to indentify file');
  }
}
