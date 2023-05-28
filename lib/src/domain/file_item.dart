import 'dart:io';

class FileItem {
  FileItem({this.file, this.directory, this.childItems, this.isRoot = false});
  File? file;
  Directory? directory;
  List<FileItem>? childItems;
  bool isRoot;
  bool get isFile => file != null;
  bool get isDirectory => directory != null;
  void addChildern(FileItem fileItem) {
    childItems ??= [];
    childItems!.add(fileItem);
  }

  @override
  String toString() {
    if (file != null) {
      return file!.uri.path.hashCode.toString();
    } else if (directory != null) {
      return directory!.path.hashCode.toString();
    }
    return 'Not able to indentify file';
  }
}
