import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';
import 'package:sharecation_app/service/api_service.dart';
import 'package:uuid/uuid.dart';

class ImageRepository {
  Future<void> saveImage({required String groupId}) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      io.Directory appDocDir = await getApplicationDocumentsDirectory();
      var directory = io.Directory("${appDocDir.path}/groups/$groupId");
      if ((await directory.exists()) == false) {
        await directory.create(recursive: true);
      }
      final extension = photo.name.split('.').last;

      await io.File(photo.path)
          .rename("${directory.path}/${const Uuid().v4()}.$extension");
      // await api.images.uploadImage(state.groupId,photo);
    }
  }

  Future<List<SharecationImage>> listFiles({required String groupId}) async {
    io.Directory appDocDir = await getApplicationDocumentsDirectory();
    final directory = io.Directory('${appDocDir.path}/groups/$groupId');
    final localImages = await directory.exists()
        ? await directory
            .list()
            .map((e) => SharecationImage(url: null, path: e.path))
            .toList()
        : List<SharecationImage>.empty();
    final images = (await api.images.getImagesByGroupId(groupId))
        .map((e) => e.imageId)
        .map((e) => SharecationImage(url: e, path: null))
        .toList();
    return localImages + images;
  }
}
