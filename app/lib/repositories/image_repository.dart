import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ImageRepository {
  Future<void> saveImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      io.Directory appDocDir = await getApplicationDocumentsDirectory();
      var directory = io.Directory("${appDocDir.path}/groups/123");
      if ((await directory.exists()) == false) {
        await directory.create(recursive: true);
      }
      final extension = photo.name
          .split('.')
          .last;

      await io.File(photo.path)
          .rename("${directory.path}/${const Uuid().v4()}.$extension");
      // await api.images.uploadImage(state.groupId,photo);
    }
  }

  Future<List<io.FileSystemEntity>> listFiles() async {
    io.Directory appDocDir = await getApplicationDocumentsDirectory();
    var directory = io.Directory('${appDocDir.path}/groups/123');
    return directory.list().toList();
  }
}
