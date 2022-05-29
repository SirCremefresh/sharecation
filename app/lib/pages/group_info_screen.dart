import 'package:flutter/material.dart';
import 'package:sharecation_app/components/group_scaffold.dart';

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
      child: const Text("GroupInfoScreen"),
    );
  }
}
