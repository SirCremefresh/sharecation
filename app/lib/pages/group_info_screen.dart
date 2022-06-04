import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';
import 'package:sharecation_app/components/group_scaffold.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';

class GroupInfoScreen extends StatefulWidget {
  final String groupId;

  const GroupInfoScreen({
    required this.groupId,
    Key? key,
  }) : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      groupScaffoldTab: GroupScaffoldTab.groupInfo,
      groupId: widget.groupId,
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
              ...state.maybeWhen<List<Widget>>(
                  loadedState: (groups, activeGroup) => [
                        Text("Name: ${activeGroup.name}"),
                        Text("GroupId: ${activeGroup.groupId}"),
                        const NotUploadedPictures(),
                        IconButton(
                          onPressed: () {
                            context
                                .read<ImagesBloc>()
                                .add(const ImagesEvent.uploadEvent());
                          },
                          icon: const Icon(Icons.cloud_upload_outlined),
                        ),
                      ],
                  orElse: () => [])
            ],
          );
        },
      ),
    );
  }
}

class NotUploadedPictures extends StatelessWidget {
  const NotUploadedPictures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc, ImagesState>(builder: (context, state) {
      return state.when(
          loadingState: () => const SizedBox.shrink(),
          loadedState: (images, groupId) {
            final localImages = images
                .where((element) =>
                    element.status == SharecationImageStatus.localOnly)
                .toList();
            return Text("Not backed up images ${localImages.length}");
          });
    });
  }
}
