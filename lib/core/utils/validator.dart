enum TaskFieldType { title, description }

String? taskValidator(String? input, TaskFieldType taskFieldType) {
  if (input == null || input.trim().isEmpty) {
    return 'Task ${taskFieldType.name} can\'t be empty';
  }
  return null;
}
