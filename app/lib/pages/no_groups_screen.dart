import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sharecation_app/blocs/main_bloc.dart';
import 'package:sharecation_app/components/create_group_modal.dart';
import 'package:sharecation_app/components/group_scaffold.dart';

class NoGroupsScreen extends StatelessWidget {
  const NoGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) =>
            state.whenOrNull(loadedState: (groups, userId) {
          if (groups.groups.isNotEmpty) {
            groutToGroup(context, groups);
          }
          return null;
        }),
        builder: (context, state) {
          return state.when(
            loadingState: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loadedState: (groups, userId) {
              return Center(
                child: Column(
                  children: [
                    const Text("No groups create group"),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CreateGroup(),
                        );
                      },
                      child: const Text("Create Group"),
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

  Future<void> groutToGroup(
      BuildContext context, SharecationGroups groups) async {
    context
        .go("/groups/${groups.groups[groups.groups.keys.first]!.groupId}/info");
  }
}
