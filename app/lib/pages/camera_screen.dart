import 'package:flutter/material.dart';
import 'package:sharecation_app/api/contracts/images/v1/images.pb.dart'
    as ApiImage;
import 'package:sharecation_app/service/api_service.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<ApiImage.Image>>(
      future: api.images.getImagesByGroupId(),
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
    ));
  }
}
