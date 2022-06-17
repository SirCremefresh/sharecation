class TaskRepository {
  List<Task> tasks = List.empty(growable: true);

  addTask(Task task) {
    tasks.add(task);
  }

  List<Task> getTasks() {
    return List.unmodifiable(tasks);
  }
}

abstract class Task {
  void start();

  void stop();
}

class PictureUploadTask extends Task {
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void stop() {
    // TODO: implement stop
  }
}
