import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';
import 'package:sharecation_app/components/GroupScaffold.dart';

class GalleryScreen extends StatefulWidget {
  final String groupId;

  GalleryScreen({
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
      child: Text("GalleryScreen"),
    );
  }
}
