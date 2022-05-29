// import 'package:flutter/material.dart';
// import 'package:sharecation_app/api/contracts/groups/v1/groups.pb.dart';
// import 'package:sharecation_app/components/group_scaffold.dart';
// import 'package:sharecation_app/service/api_service.dart';
//
// class GroupScreen extends StatefulWidget {
//   const GroupScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<GroupScreen> createState() => _GroupScreenState();
// }
//
// class _GroupScreenState extends State<GroupScreen> {
//   late TextEditingController _controller;
//   String text = "";
//   List<Group> groups = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//     _controller.addListener(() {
//       setState(() {
//         text = _controller.value.text;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Layout(
//       child: Scaffold(
//         body: Column(
//           children: [
//             TextField(
//               controller: _controller,
//             ),
//             TextButton(
//                 onPressed: () async {
//                   await api.groups
//                       .createGroup(groupName: _controller.value.text);
//                   authenticationService.invalidate();
//                   var newGroups = await api.groups.getGroups();
//                   setState(() {
//                     groups = newGroups;
//                   });
//                 },
//                 child: const Text("submit")),
//             Text("your input is:" + text),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: groups.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Text("List item $index ${groups[index].name}");
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
