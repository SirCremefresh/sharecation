import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/active_group_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/repositories/image_repository.dart';

enum GroupScaffoldTab { groupInfo, swipe, gallery }

class Layout extends StatelessWidget {
  final Widget child;
  final String groupId;
  final GroupScaffoldTab groupScaffoldTab;

  const Layout(
      {Key? key,
      required this.child,
      required this.groupId,
      required this.groupScaffoldTab})
      : super(key: key);

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
            context.go('/groups/$groupId/gallery');
          } else if (tab == GroupScaffoldTab.swipe) {
            context.go('/groups/$groupId/swipe');
          } else {
            context.go('/groups/$groupId/info');
          }
        },
        currentIndex: groupScaffoldTab.index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: "Swipe",
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
          await ImageRepository().saveImage(groupId: groupId);
        },
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildDrawerHeader(),
          BlocBuilder<GroupsBloc, GroupsState>(
            builder: (context, state) {
              if (state is GroupsLoaded) {
                return buildGroupsList(state);
              }
              return const CircularProgressIndicator();
            },
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Create Group"),
          )
        ],
      ),
    );
  }

  Expanded buildGroupsList(GroupsLoaded state) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.groups.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              onPressed: () {
                context.read<ActiveGroupBloc>().add(
                      SelectGroupEvent(groupId: state.groups[index].groupId),
                    );
              },
              child: Text(state.groups[index].name),
            );
          }),
    );
  }

  SizedBox buildDrawerHeader() {
    return const SizedBox(
      height: 64.0,
      child: DrawerHeader(
        child: Text(
          'Groups',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        decoration: BoxDecoration(color: Colors.black),
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
      ),
    );
  }
}
