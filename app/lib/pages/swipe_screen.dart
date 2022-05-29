import 'package:flutter/material.dart';
import 'package:sharecation_app/components/group_scaffold.dart';

class SwipeScreen extends StatefulWidget {
  final String groupId;

  const SwipeScreen({
    required this.groupId,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      groupId: widget.groupId,
      child: const Text("SwipeScreen"),
    );
  }
}
