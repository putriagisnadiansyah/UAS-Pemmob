class Blog {
  final int id;
  final String name;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Blog({
    required this.id,
    required this.name,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method untuk mengonversi JSON menjadi objek Blog
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      name: json['name'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Metode untuk mengonversi objek Blog kembali menjadi Map (untuk JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
