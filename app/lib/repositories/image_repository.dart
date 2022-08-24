import 'dart:io' as io;

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sharecation_app/blocs/main_bloc.dart';
import 'package:sharecation_app/service/api_service.dart';
import 'package:uuid/uuid.dart';

class ImageRepository {
  Future<SharecationImage?> saveImage({required String groupId}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      io.Directory appDocDir = await getApplicationDocumentsDirectory();
      var directory = io.Directory("${appDocDir.path}/groups/$groupId");
      if ((await directory.exists()) == false) {
        await directory.create(recursive: true);
      }
      final externalId = const Uuid().v4();
      final path = "${directory.path}/$externalId.png";
      await io.File(photo.path).rename(path);
      return SharecationImage.locale(externalId: externalId, path: path);
    }
    return null;
  }

  Future<SharecationImage> uploadImage(
      {required String groupId, required String path}) async {
    final file = XFile(path);
    final uploadedImage = await api.images.uploadImage(
      groupId,
      file,
    );

    final appDocDir = await getApplicationDocumentsDirectory();
    final syncedDirectory =
        io.Directory('${appDocDir.path}/groups/$groupId/synced/');
    if ((await syncedDirectory.exists()) == false) {
      await syncedDirectory.create(recursive: true);
    }
    var newPath =
        '${appDocDir.path}/groups/$groupId/synced/${uploadedImage.imageId}';
    await io.File(path).rename(newPath);
    // return SharecationImage.synced(
    //     path: newPath,
    //     imageId: uploadedImage.imageId,
    //     status: SharecationImageStatus.synced);
    throw Exception("TODO");
  }

  Future<void> downloadImagesFromServer({required String groupId}) async {
    final remoteImages = await api.images.getImagesByGroupId(groupId);
    final appDocDir = await getApplicationDocumentsDirectory();
    final directory = io.Directory('${appDocDir.path}/groups/$groupId/synced');
    if (await directory.exists() == false) {
      await directory.create(recursive: true);
    }
    final localFiles = await directory.list().map((file) => file.name).toList();

    final notSyncedImages = remoteImages
        .where((element) => !localFiles.contains(element.imageId))
        .toList();

    for (var value in notSyncedImages) {
      api.images.downloadImage(value.url,
          '${appDocDir.path}/groups/$groupId/synced/${value.imageId}.png');
    }
  }

// Future<List<SharecationImage>> listFiles({required String groupId}) async {
//   final appDocDir = await getApplicationDocumentsDirectory();
//   final directory =
//       io.Directory('${appDocDir.path}/groups/$groupId/local-only');
//   final localImages = await directory.exists()
//       ? await directory
//           .list()
//           .map((file) => SharecationImage(
//               path: file.path,
//               imageId: file.name,
//               status: SharecationImageStatus.localOnly))
//           .toList()
//       : List<SharecationImage>.empty();
//
//   final syncedDirectory =
//       io.Directory('${appDocDir.path}/groups/$groupId/synced');
//   final syncedImages = await syncedDirectory.exists()
//       ? await syncedDirectory
//           .list()
//           .map((file) => SharecationImage(
//               path: file.path,
//               imageId: file.name,
//               status: SharecationImageStatus.synced))
//           .toList()
//       : List<SharecationImage>.empty();
//
//   return localImages + syncedImages;
// }
}

extension FileExtention on io.FileSystemEntity {
  String get name {
    return path.split("/").last.split(".").first;
  }
}
