import 'dart:io';

class FileItem {
  FileItem({this.file, this.directory, this.childItems});
  File? file;
  Directory? directory;
  List<FileItem>? childItems;

  bool get isFile => file != null;
  bool get isDirectory => directory != null;
  void addChildern(FileItem fileItem) {
    childItems ??= [];
    childItems!.add(fileItem);
  }
}
