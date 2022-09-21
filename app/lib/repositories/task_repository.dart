import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/blocs/main_bloc.dart';
import 'package:sharecation_app/blocs/task_bloc.dart';
import 'package:sharecation_app/repositories/image_repository.dart';
import 'package:uuid/uuid.dart';

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
  final TaskBloc taskBloc;

  TaskRepository({required this.mainBloc, required this.taskBloc});

  Future<void> addTask(TaskConfig taskConfig) async {
    var taskRun = TaskRun(
        taskConfig: taskConfig,
        taskRunId: const Uuid().v4(),
        taskState: TaskState.created);
    taskBloc.add(TaskEvent.upsertTaskConfig(taskRun: taskRun));
    final task = getTaskForTaskConfig(taskConfig);
    await task.start(mainBloc, this);
    taskBloc.add(
      TaskEvent.upsertTaskConfig(
        taskRun: taskRun.copyWith(taskState: TaskState.finished),
      ),
    );
  }

  Task getTaskForTaskConfig(TaskConfig taskConfig) => taskConfig.map(
      imageUpload: (data) => PictureUploadTask(data),
      createImage: (data) => CreateImageTask(data));
}

abstract class Task {
  Future<void> start(MainBloc mainBloc, TaskRepository taskRepository);

  void stop();
}

enum TaskState { created, finished }

@freezed
class TaskRun with _$TaskRun {
  const factory TaskRun(
      {required TaskConfig taskConfig,
      required String taskRunId,
      required TaskState taskState}) = _TaskRun;
}

@Freezed(unionKey: 'type')
class TaskConfig with _$TaskConfig {
  const TaskConfig._();

  @FreezedUnionValue('imageUpload')
  const factory TaskConfig.imageUpload(
      {required String externalId,
      required String groupId}) = TaskConfigImageUpload;

  @FreezedUnionValue('createImage')
  const factory TaskConfig.createImage({required String groupId}) =
      TaskConfigCreateImage;

  factory TaskConfig.fromJson(Map<String, dynamic> json) =>
      _$TaskConfigFromJson(json);

  String getName() => map(
    imageUpload: (_) => "image_upload",
    createImage: (_) => "create_image",
  );
}

class PictureUploadTask extends Task {
  TaskConfigImageUpload data;

  PictureUploadTask(this.data);

  @override
  Future<void> start(MainBloc mainBloc, TaskRepository taskRepository) async {
    await ImageRepository()
        .uploadImage(groupId: data.groupId, externalId: data.externalId);
  }

  @override
  void stop() {
    // TODO: implement stop
  }
}

class CreateImageTask extends Task {
  TaskConfigCreateImage data;

  CreateImageTask(this.data);

  @override
  Future<void> start(MainBloc mainBloc, TaskRepository taskRepository) async {
    final image = await ImageRepository().saveImage(groupId: data.groupId);
    if (image != null) {
      taskRepository.addTask(
        TaskConfig.imageUpload(
          externalId: image.externalId,
          groupId: data.groupId,
        ),
      );
    }
  }

  @override
  void stop() {
    // TODO: implement stop
  }
}
