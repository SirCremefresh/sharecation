import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';

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
              if (state is GroupsStateLoaded) {
                return buildGroupsList(context, state.groups);
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }

  Widget buildGroupsList(BuildContext context, List<Group> groups) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: groups.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              onPressed: () {
                context.go("/groups/${groups[index].groupId}/gallery");
              },
              child: Text(groups[index].name),
            );
          }),
    );
  }
}
