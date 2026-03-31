class TodoModel {
  final int? id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  TodoModel({
    this.id,
    required this.title,
    this.isCompleted = false,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'is_completed': isCompleted,
    'created_at': createdAt.toIso8601String(),
  };

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json['id'],
    title: json['title'],
    isCompleted: json['is_completed'],
    createdAt: DateTime.parse(json['created_at']),
  );

  TodoModel copyWith({String? title, bool? isCompleted}) => TodoModel(
    id: id,
    title: title ?? this.title,
    isCompleted: isCompleted ?? this.isCompleted,
    createdAt: createdAt,
  );
}