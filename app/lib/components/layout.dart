import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecation_app/service/api_service.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sharecation'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/profile');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/camera');
          } else {
            Navigator.of(context).pushReplacementNamed('/profile');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance_outlined),
            label: "Camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_roll_outlined),
            label: "Gallery",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          final ImagePicker _picker = ImagePicker();
          final XFile? photo =
              await _picker.pickImage(source: ImageSource.camera);
          if (photo != null) {
            await api.images.uploadImage(photo);
          }
        },
      ),
    );
  }
}
