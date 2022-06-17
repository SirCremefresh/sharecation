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
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return state.when(
            loadingState: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loadedState: (groups, userId) {
              if (groups.groups.isNotEmpty) {
                groutToGroup(context, groups);
              }
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
    await Future.delayed(const Duration(milliseconds: 10));
    context
        .go("/groups/${groups.groups[groups.groups.keys.first]!.groupId}/info");
  }
}
