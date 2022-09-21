part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.upsertTaskConfig({required TaskRun taskRun}) = _UpsertTaskConfig;
}
