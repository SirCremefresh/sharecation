import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharecation_app/repositories/task_repository.dart';

part 'task_bloc.freezed.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(taskRuns: List.empty(growable: false))) {
    on<TaskEvent>((event, emit) => event.map(upsertTaskConfig: (event) {
          final taskRuns = List.of(state.taskRuns);
          taskRuns.removeWhere(
            (element) => element.taskRunId == event.taskRun.taskRunId,
          );
          taskRuns.add(event.taskRun);
          emit(TaskState(
            taskRuns: taskRuns,
          ));
          return null;
        }));
  }

  @override
  void onTransition(Transition<TaskEvent, TaskState> transition) {
    super.onTransition(transition);
    // transition.nextState.whenOrNull<void>(loadedState: (state, userId) {
    //   fileRepository.write(userId: userId, newContent: state);
    // });
  }
}
