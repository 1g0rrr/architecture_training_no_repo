import 'package:architecturetraining/blocks/task/task_bloc.dart';
import 'package:architecturetraining/blocks/todo_list/todo_list_bloc.dart';
import 'package:architecturetraining/widgets/task_bloc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListBlocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListBloc>(
      create: (context) => TodoListBloc()..add(Loaded_TodoListEvent()),
      child: BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          TodoListBloc todoListBloc = BlocProvider.of<TodoListBloc>(context);

          List<Widget> tasksWidgets = List<Widget>();

          if (state is Regular_TodoListState) {
            List<TaskBloc> tasksList = todoListBloc.tasksList;

            for (TaskBloc taskBloc in tasksList) {
              tasksWidgets.add(TaskBlocWidget(taskBloc));
            }
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tasksWidgets,
          );
        },
      ),
    );
  }
}
