// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sharecation_app/blocs/active_group_bloc.dart';
// import 'package:sharecation_app/components/GroupScaffold.dart';
// import 'package:sharecation_app/dtos/sharecation_image.dart';
// import 'package:sharecation_app/repositories/image_repository.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Layout(
//       child: BlocBuilder<ActiveGroupBloc, ActiveGroupState>(
//         builder: (context, state) {
//           if (state is ActiveGroupSelected) {
//             return groupScreen(state);
//           }
//           return const Text('no group selected');
//         },
//       ),
//     );
//   }
//
//   Widget groupScreen(ActiveGroupSelected state) {
//     return FutureBuilder<List<SharecationImage>>(
//         future: ImageRepository().listFiles(groupId: state.groupId),
//         initialData: const [],
//         builder: (context, snapshot) {
//           final data = snapshot.data?.join(' ') ?? 'none';
//           return Text('selected group: ' + state.groupId + 'images: ' + data);
//         });
//   }
// }
