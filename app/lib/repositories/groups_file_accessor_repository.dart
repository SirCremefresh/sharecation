import 'dart:convert';
import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';
import 'package:sharecation_app/blocs/groups_bloc.dart';

class GroupsFileAccessorRepository {
  SharecationGroups? _content;
  io.File? _file;
  Future<void>? _writeFuture;
  int _queue = 0;

  Future<SharecationGroups> read() async {
    if (_content != null) {
      return _content!;
    }
    final file = await _getFile();
    final exists = await file.exists();
    final SharecationGroups readContent;
    if (exists) {
      final contentString = await file.readAsString();
      readContent = SharecationGroups.fromJson(jsonDecode(contentString));
    } else {
      readContent = const SharecationGroups(groups: {});
    }
    if (_content != null) {
      return _content!;
    }
    _content = readContent;
    return readContent;
  }

  Future<void> write(SharecationGroups newContent) async {
    _content = newContent;
    final queuePosition = ++_queue;
    if (queuePosition == 1) {
      final file = await _getFile();
      _writeFuture = file.writeAsString(jsonEncode(newContent.toJson()));
      await _writeFuture;
      return;
    }
    await _writeFuture!;
    if (queuePosition == _queue) {
      _queue = 0;
      _writeFuture = null;
      await write(newContent);
    }
  }

  Future<io.File> _getFile() async {
    if (_file == null) {
      final appDocDir = await getApplicationDocumentsDirectory();
      _file = io.File('${appDocDir.path}/state.json');
    }

    return _file as io.File;
  }
}
