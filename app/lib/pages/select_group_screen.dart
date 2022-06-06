import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/components/create_group_modal.dart';

class SelectGroupScreen extends StatefulWidget {
  const SelectGroupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectGroupScreen> createState() => _SelectGroupScreenState();
}

class _SelectGroupScreenState extends State<SelectGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sharecation'),
      ),
      body: Column(
        children: [
          const Text("Select A group"),
          BlocBuilder<GroupsBloc, GroupsState>(
            builder: (context, state) {
              return state.when(
                loadingState: () => const CircularProgressIndicator(),
                loadedState: (groups, userId) =>
                    buildGroupsList(context, groups.groups),
              );
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

  Widget buildGroupsList(
      BuildContext context, Map<String, SharecationGroup> groups) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: groups.length,
          itemBuilder: (BuildContext context, int index) {
            final key = groups.keys.elementAt(index);
            return TextButton(
              onPressed: () {
                context.go("/groups/${groups[key]!.groupId}/gallery");
              },
              child: Text(groups[key]!.name),
            );
          }),
    );
  }
}
