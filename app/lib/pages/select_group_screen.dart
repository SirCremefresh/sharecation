import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/components/create_group_modal.dart';
import 'package:sharecation_app/components/group_scaffold.dart';

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
    return Layout(
      child: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
          return state.when(
            loadingState: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loadedState: (groups, userId) {
              return Center(
                child: Column(
                  children: [
                    Text("No groups create group"),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CreateGroup(),
                        );
                      },
                      child: Text("Create Group"),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
