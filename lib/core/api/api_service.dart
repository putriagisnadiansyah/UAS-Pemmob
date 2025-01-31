import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/blog.dart'; // Pastikan path ini sesuai dengan struktur proyek

class ApiService {
  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(
      Uri.parse('http://localhost/api/blogs'), // Ganti URL sesuai kebutuhan
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Blog.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}
