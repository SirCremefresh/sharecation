import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/service/api_service.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GroupsBloc>().add(LoadGroupsEvent());

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
      child: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
          if (state is GroupsLoaded) {
            return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.groups.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return buildDrawerHeader();
                  }
                  return TextButton(
                    onPressed: () {},
                    child: Text(state.groups[index - 1].name),
                  );
                });
          }
          return ListView(
            children: [
              buildDrawerHeader(),
              const LoadingIndicator(
                borderWidth: 4,
                size: 50,
              )
            ],
          );
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
