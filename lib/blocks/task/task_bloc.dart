import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  String _taskTitle;

  String get taskTitle => _taskTitle;

  TaskBloc({@required String taskTitle})
      : assert(taskTitle != null),
        _taskTitle = taskTitle {}

  @override
  TaskState get initialState => Static_TaskState();

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is StartEdition_TaskEvent) {
      yield Editing_TaskState();
    }

    if (event is EndEdition_TaskEvent) {
      _taskTitle = event.taskTitle;
      yield Static_TaskState();
    }
  }
}
