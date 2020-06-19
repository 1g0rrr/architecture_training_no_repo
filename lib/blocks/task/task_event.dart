part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class StartEdition_TaskEvent extends TaskEvent {}

class EndEdition_TaskEvent extends TaskEvent {
  String taskTitle;
  EndEdition_TaskEvent(this.taskTitle);
}
