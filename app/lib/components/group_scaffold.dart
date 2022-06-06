import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/components/create_group_modal.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sharecation'),
      ),
      body: child,
      drawer: const SharecationDrawer(),
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
          // context.read<ImagesBloc>().add(const ImagesEvent.addEvent());
        },
      ),
    );
  }
}

class SharecationDrawer extends StatelessWidget {
  const SharecationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          shareCationDrawerHeader(),
          BlocBuilder<GroupsBloc, GroupsState>(
            builder: (context, state) => state.when(
              loadingState: () => const CircularProgressIndicator(),
              loadedState: (groups, userId) =>
                  DrawerGroupsList(groups: groups.groups),
            ),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateGroup(),
              );
            },
            child: const Text("Create Group"),
          )
        ],
      ),
    );
  }

  SizedBox shareCationDrawerHeader() {
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

class DrawerGroupsList extends StatelessWidget {
  final Map<String, SharecationGroup> groups;

  const DrawerGroupsList({
    required this.groups,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          // context
          //     .read<GroupsBloc>()
          //     .add(const GroupsEvent.loadEvent(force: true));
        },
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int index) {
              final key = groups.keys.elementAt(index);
              return TextButton(
                onPressed: () {
                  context.go('/groups/${groups[key]!.groupId}/info');
                },
                child: Text(groups[key]!.name),
              );
            }),
      ),
    );
  }
}
