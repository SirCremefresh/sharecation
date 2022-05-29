import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/images_bloc.dart';
import 'package:sharecation_app/components/group_scaffold.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';

class GalleryScreen extends StatefulWidget {
  final String groupId;

  const GalleryScreen({
    required this.groupId,
    Key? key,
  }) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      groupId: widget.groupId,
      child: Scaffold(body: BlocBuilder<ImagesBloc, ImagesState>(
        builder: (context, state) {
          if (state is ImagesLoaded) {
            return buildImagesLocalList(state.images);
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }

  Widget buildImagesLocalList(List<SharecationImage> images) {
    return GridView.builder(
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
            child: buildImage(images[index]));
        // Item rendering
      },
    );
  }

  Widget buildImage(SharecationImage image) {
    if (image.url != null) {
      return Image.network(image.url!, fit: BoxFit.fill);
    }
    return Stack(fit: StackFit.expand, children: [
      Image.file(File(image.path!), fit: BoxFit.fill),
      const Positioned(right: 4, top: 4, child: Icon(Icons.cloud_off))
    ]);
  }
}
