import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/active_group_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/repositories/image_repository.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({Key? key, required this.child}) : super(key: key);

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
          final tab = GroupScaffoldTab.values[index];
          if (tab == GroupScaffoldTab.gallery) {
            context.go('/profile');
          } else if (tab == GroupScaffoldTab.swipe) {
            context.go('/camera');
          } else {
            context.go('/groups');
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
      floatingActionButton: BlocBuilder<ActiveGroupBloc, ActiveGroupState>(
        builder: (context, state) {
          if (state is ActiveGroupSelected) {
            return FloatingActionButton(
              child: const Icon(Icons.camera),
              onPressed: () async {
                await ImageRepository().saveImage(groupId: state.groupId);
              },
            );
          }
          return const SizedBox.shrink();
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
                    onPressed: () {
                      context.read<ActiveGroupBloc>().add(SelectGroupEvent(
                          groupId: state.groups[index - 1].groupId));
                    },
                    child: Text(state.groups[index - 1].name),
                  );
                });
          }
          return ListView(
            children: [buildDrawerHeader(), const CircularProgressIndicator()],
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

enum GroupScaffoldTab { groupInfo, swipe, gallery }
