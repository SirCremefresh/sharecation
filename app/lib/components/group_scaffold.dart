import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
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
          await ImageRepository().saveImage(groupId: groupId);
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
            builder: (context, state) {
              if (state is GroupsLoaded) {
                return buildGroupsList(state);
              }
              return const CircularProgressIndicator();
            },
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

class CreateGroup extends StatefulWidget {
  const CreateGroup({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  late TextEditingController _controller;
  String text = "";
  List<Group> groups = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        text = _controller.value.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "New Group",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              controller: _controller,
            ),
            TextButton(onPressed: () async {}, child: const Text("create")),
          ],
        ),
      ),
    );
  }
}
