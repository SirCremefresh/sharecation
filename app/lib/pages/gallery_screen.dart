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
      groupScaffoldTab: GroupScaffoldTab.gallery,
      groupId: widget.groupId,
      child: Scaffold(body: BlocBuilder<ImagesBloc, ImagesState>(
        builder: (context, state) {
          if (state is! ImagesLoaded) {
            return const CircularProgressIndicator();
          }
          if (state.images.isEmpty) {
            return const NoImages();
          }
          return ImagesGrid(images: state.images);
        },
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

  const ImagesGrid({
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: PreviewImage(image: images[index]),
        );
      },
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
    if (image.url != null) {
      return Image.network(image.url!, fit: BoxFit.fill);
    }
    return Stack(fit: StackFit.expand, children: [
      Image.file(File(image.path!), fit: BoxFit.fill),
      const Positioned(right: 4, top: 4, child: Icon(Icons.cloud_off))
    ]);
  }
}
