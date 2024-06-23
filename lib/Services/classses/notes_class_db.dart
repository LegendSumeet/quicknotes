class LocalNote {
  final int id;
  final String category;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;

  LocalNote({
    required this.id,
    required this.category,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to convert a map into a Note object
  factory LocalNote.fromMap(Map<String, dynamic> map) {
    return LocalNote(
      id: map['id'],
      category: map['category'],
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  // Convert Note object into a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  String toString() {
    return 'Note{id: $id, category: $category, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
