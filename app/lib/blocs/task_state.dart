part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState({required List<TaskRun> taskRuns}) = _TaskState;
}
