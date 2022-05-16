import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pbserver.dart';
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
      drawer: buildDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/profile');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed('/camera');
          } else {
            Navigator.of(context).pushReplacementNamed('/groups');
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

  Drawer buildDrawer() {
    return Drawer(
      child: FutureBuilder<List<Group>>(
        future: api.groups.getGroups(),
        initialData: const [],
        builder: (context, data) {
          if (!data.hasData) {
            return ListView(
              children: [
                buildDrawerHeader(),
                const LoadingIndicator(
                  borderWidth: 4,
                  size: 50,
                )
              ],
            );
          }
          var groups = data.data!;
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: groups.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return buildDrawerHeader();
                }
                return TextButton(
                  onPressed: () {},
                  child: Text(groups[index - 1].name),
                );
              });
        },
      ),
    );
  }

  SizedBox buildDrawerHeader() {
    return const SizedBox(
      height: 64.0,
      child: DrawerHeader(
        child: Text('Groups', style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(color: Colors.black),
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
      ),
    );
  }
}
