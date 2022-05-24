import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/api/contracts/images/v1/images.pb.dart'
    as api_image;
import 'package:sharecation_app/blocs/active_group_bloc.dart';
import 'package:sharecation_app/dtos/sharecation_image.dart';
import 'package:sharecation_app/repositories/image_repository.dart';
import 'package:sharecation_app/service/api_service.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ActiveGroupBloc, ActiveGroupState>(
      builder: (context, state) {
        if (state is ActiveGroupSelected) {
          return buildImagesLocalList(state.groupId);
        }
        return const CircularProgressIndicator();
      },
    ));
  }

  FutureBuilder<List<SharecationImage>> buildImagesLocalList(String groupId) {
    return FutureBuilder<List<SharecationImage>>(
      future: ImageRepository().listFiles(groupId: groupId),
      initialData: const [],
      builder: (imagesds, imagesS) {
        var images = imagesS.data;
        if (images == null) {
          return const SizedBox.shrink();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            crossAxisCount: 3,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return buildImage(images[index]);
            // Item rendering
          },
        );
        // ListView.builder(
        //     itemCount: images.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return Column(
        //         children: [
        //           Text("List item $index ${images[index].path}"),
        //           Image.file(File(images[index].path))
        //           // Image.network(images[index].imageId)
        //         ],
        //       );
        //     });
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

  FutureBuilder<List<api_image.Image>> buildImagesList(String groupId) {
    return FutureBuilder<List<api_image.Image>>(
      future: api.images.getImagesByGroupId(groupId),
      initialData: const [],
      builder: (imagesds, imagesS) {
        var images = imagesS.data!;
        return ListView.builder(
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text("List item $index ${images[index].imageId}"),
                  Image.network(images[index].imageId)
                ],
              );
            });
      },
    );
  }
}
