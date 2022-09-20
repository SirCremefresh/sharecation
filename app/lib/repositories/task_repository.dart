import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/blocs/main_bloc.dart';

part 'task_repository.freezed.dart';

part 'task_repository.g.dart';


//
// flutter -> tasks, bloc
// bloc -> api
// api
// tasks -> api, bloc
//

class TaskRepository {
  final MainBloc mainBloc;
  List<Task> tasks = List.empty(growable: true);

  TaskRepository({required this.mainBloc});

  addTask(Task task) {
    tasks.add(task);
  }

  List<Task> getTasks() {
    return List.unmodifiable(tasks);
  }

  Task getTaskForTaskConfig(TaskConfig taskConfig) =>
      taskConfig.map(imageUpload: (data) => PictureUploadTask(data));
}

abstract class Task {
  void start();

  void stop();
}

@Freezed(unionKey: 'type')
class TaskConfig with _$TaskConfig {
  const TaskConfig._();

  @FreezedUnionValue('imageUpload')
  const factory TaskConfig.imageUpload({required String externalId}) =
      TaskConfigImageUpload;

  factory TaskConfig.fromJson(Map<String, dynamic> json) =>
      _$TaskConfigFromJson(json);
}

class PictureUploadTask extends Task {
  TaskConfigImageUpload data;

  PictureUploadTask(this.data);

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void stop() {
    // TODO: implement stop
  }
}
