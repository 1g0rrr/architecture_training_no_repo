part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class Static_TaskState extends TaskState {}

class Editing_TaskState extends TaskState {}
