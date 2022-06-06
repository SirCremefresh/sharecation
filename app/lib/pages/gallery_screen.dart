import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/components/group_scaffold.dart';

class GalleryScreen extends StatelessWidget {
  final String groupId;

  const GalleryScreen({
    required this.groupId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      groupScaffoldTab: GroupScaffoldTab.gallery,
      groupId: groupId,
      child: Scaffold(
          body: BlocBuilder<GroupsBloc, GroupsState>(
        builder: (context, state) => state.when(
            loadingState: () => const CircularProgressIndicator(),
            loadedState: (state, userid) {
              return ImagesGrid(
                  images: state.groups[groupId]!.images.values
                      .where((element) => element.displayable())
                      .toList(growable: false),
                  groupId: groupId);
            }),
      )),
    );
  }
}

class NoImages extends StatelessWidget {
  const NoImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "No Pictures",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Make a picture and it will appear here",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class ImagesGrid extends StatelessWidget {
  final List<SharecationImage> images;
  final String groupId;

  const ImagesGrid({
    required this.images,
    required this.groupId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // context
        //     .read<ImagesBloc>()
        //     .add(ImagesEvent.loadEvent(groupId: groupId, force: true));
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(3),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            child: PreviewImage(image: images[index]),
          );
        },
      ),
    );
  }
}

class PreviewImage extends StatelessWidget {
  final SharecationImage image;

  const PreviewImage({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image.maybeMap(
      locale: (state) {
        return Stack(fit: StackFit.expand, children: [
          Image.file(File(state.path), fit: BoxFit.fill),
          const Positioned(right: 4, top: 4, child: Icon(Icons.cloud_off))
        ]);
      },
      synced: (state) {
        return Image.file(File(state.path), fit: BoxFit.fill);
      },
      orElse: () => Text("shit"),
    );
  }
}
