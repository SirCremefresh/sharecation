import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/components/group_scaffold.dart';

class SynchroniseScreen extends StatelessWidget {
  const SynchroniseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Group Info",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              ...state.maybeWhen(
                  loadedState: (groups, userId) => [
                        Text(
                          "Total images: ${getTotalImages(groups.groups)}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              context.read<GroupsBloc>().add(const GroupsEvent.loadImages());
                            },
                            child: const Text("Load images from server"))
                      ],
                  orElse: () {
                    return [];
                  }),
            ],
          );
        },
      ),
    );
  }

  int getTotalImages(Map<String, SharecationGroup> groups) {
    return groups.values.expand((e) => e.images.values).length;
  }
}
