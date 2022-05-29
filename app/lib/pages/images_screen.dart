// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sharecation_app/blocs/active_group_bloc.dart';
// import 'package:sharecation_app/components/group_scaffold.dart';
// import 'package:sharecation_app/dtos/sharecation_image.dart';
// import 'package:sharecation_app/repositories/image_repository.dart';
//
// class ImagesScreen extends StatelessWidget {
//   const ImagesScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Layout(
//       child: Scaffold(body: BlocBuilder<ActiveGroupBloc, ActiveGroupState>(
//         builder: (context, state) {
//           if (state is ActiveGroupSelected) {
//             return buildImagesLocalList(state.groupId);
//           }
//           return const CircularProgressIndicator();
//         },
//       )),
//     );
//   }
//
//   FutureBuilder<List<SharecationImage>> buildImagesLocalList(String groupId) {
//     return FutureBuilder<List<SharecationImage>>(
//       future: ImageRepository().listFiles(groupId: groupId),
//       initialData: const [],
//       builder: (imagesds, imagesS) {
//         var images = imagesS.data;
//         if (images == null) {
//           return const SizedBox.shrink();
//         }
//         return GridView.builder(
//           padding: const EdgeInsets.all(3),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisSpacing: 3,
//             mainAxisSpacing: 3,
//             crossAxisCount: 3,
//           ),
//           itemCount: images.length,
//           itemBuilder: (context, index) {
//             return ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(3)),
//                 child: buildImage(images[index]));
//             // Item rendering
//           },
//         );
//       },
//     );
//   }
//
//   Widget buildImage(SharecationImage image) {
//     if (image.url != null) {
//       return Image.network(image.url!, fit: BoxFit.fill);
//     }
//     return Stack(fit: StackFit.expand, children: [
//       Image.file(File(image.path!), fit: BoxFit.fill),
//       const Positioned(right: 4, top: 4, child: Icon(Icons.cloud_off))
//     ]);
//   }
// }
