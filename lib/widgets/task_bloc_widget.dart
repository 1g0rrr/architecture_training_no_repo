import 'package:architecturetraining/blocks/task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBlocWidget extends StatelessWidget {
  final TaskBloc taskBloc;

  TaskBlocWidget(this.taskBloc);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
      create: (context) => taskBloc,
      child: BlocBuilder<TaskBloc, TaskState>(
        //todo если не присваивать этот блок, то билдер не срабатывает! ( И сейчас провайдер вообще лишний.
        bloc: taskBloc,
        builder: (context, state) {
          print('state: ' + state.toString());
          if (state is Static_TaskState) {
            return _buildStaticPanel(taskBloc);
          }
          if (state is Editing_TaskState) {
            return _buildEditingPanel(taskBloc);
          }

          return Container(
            child: Text('No state found'),
          );
        },
      ),
    );
  }
}

Widget _buildStaticPanel(TaskBloc taskBloc) {
  return GestureDetector(
    onDoubleTap: () {
      print('double tap');
      taskBloc.add(StartEdition_TaskEvent());
    },
    child: Container(
      color: Colors.black26,
      height: 50,
      width: 150,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(taskBloc.taskTitle),
    ),
  );
}

Widget _buildEditingPanel(TaskBloc taskBloc) {
  TextEditingController _inputFieldController = TextEditingController(
    text: taskBloc.taskTitle,
  );

  return Container(
    color: Colors.orangeAccent,
    height: 50,
    width: 150,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      autofocus: true,
      textInputAction: TextInputAction.done,
      onSubmitted: (newText) {
        print('submit: ' + _inputFieldController.text);
        taskBloc.add(EndEdition_TaskEvent(newText));
      },
      controller: _inputFieldController,
    ),
  );
}
