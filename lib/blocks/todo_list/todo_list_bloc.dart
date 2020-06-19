import 'dart:async';

import 'package:architecturetraining/blocks/task/task_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  List<TaskBloc> tasksList = List<TaskBloc>();

  @override
  TodoListState get initialState => Initial_TodoListState();

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    if (event is Loaded_TodoListEvent) {
      //Creating taskBloc-s every time after data from database downloaded
      //SAMPLE DATA
      for (int i = 0; i < 5; i++) {
        TaskBloc newTaskBloc = TaskBloc(taskTitle: 'Task ' + i.toString());
        tasksList.add(newTaskBloc);
      }
      yield Regular_TodoListState();
    }
  }
}
