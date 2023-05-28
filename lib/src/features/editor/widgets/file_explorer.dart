import 'package:flutter/material.dart';
import 'package:vscode_flutter/src/domain/file_item.dart';
import 'package:vscode_flutter/src/features/editor/widgets/file_name.dart';

class FileExplorer extends StatelessWidget {
  const FileExplorer(
      {required this.fileItem, required this.onFileSelected, super.key});
  final FileItem fileItem;
  final Function(FileItem) onFileSelected;
  @override
  Widget build(BuildContext context) {
    if (!fileItem.isDirectory) return SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FileName(fileItem: fileItem),
        if (fileItem.childItems != null && fileItem.childItems!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (fileItem.childItems![index].isDirectory) {
                  return FileExplorer(
                      fileItem: fileItem.childItems![index],
                      onFileSelected: onFileSelected);
                }
                return InkWell(
                    onTap: () => onFileSelected(fileItem.childItems![index]),
                    child: FileName(fileItem: fileItem.childItems![index]));
              },
              itemCount: fileItem.childItems!.length,
            ),
          ),
      ],
    );
  }
}
