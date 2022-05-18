import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/api/contracts/images/v1/images.pb.dart'
    as api_image;
import 'package:sharecation_app/blocs/active_group_bloc.dart';
import 'package:sharecation_app/service/api_service.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ActiveGroupBloc, ActiveGroupState>(
      builder: (context, state) {
        if (state is ActiveGroupSelected) {
          return buildImagesList(state.groupId);
        }
        return const CircularProgressIndicator();
      },
    ));
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
