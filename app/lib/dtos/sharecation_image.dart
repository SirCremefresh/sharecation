class SharecationImage {
  final String imageId;
  final SharecationImageStatus status;
  final String path;

  const SharecationImage(
      {required this.imageId, required this.status, required this.path});
}

enum SharecationImageStatus { localOnly, synced }
