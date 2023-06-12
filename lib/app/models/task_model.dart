class Task {
  final String title;
  final String description;
  final bool isDone;

  Task({
    required this.title,
    this.description = "",
    this.isDone = false,
  });

  Task copyWith({
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }
}
