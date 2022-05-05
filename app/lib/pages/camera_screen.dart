import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecation_app/service/api_service.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: loadImage,
      child: const Text("hello"),
    ));
  }

  void loadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      await api.images.uploadImage(photo);
    }
  }
}
