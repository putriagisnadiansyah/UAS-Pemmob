import '../../domain/usecases/navigate_to_page.dart';
import '../../core/api/api_service.dart';
import '../../domain/entities/blog.dart';

class HomeController {
  final NavigateToPageUseCase _navigateToPageUseCase;
  final ApiService _apiService;

  // Constructor untuk menginisialisasi controller
  HomeController(this._navigateToPageUseCase, this._apiService);

  // Metode untuk mengambil data Blog menggunakan ApiService
  Future<List<Blog>> fetchBlogs() async {
    try {
      // Panggil method fetchBlogs dari ApiService dan kembalikan hasilnya
      final blogs = await _apiService.fetchBlogs();
      return blogs;
    } catch (error) {
      // Tangani error jika terjadi
      print('Error fetching blogs: $error');
      return [];
    }
  }

  // Metode yang akan dipanggil saat bottom navigation di-tap
  void onBottomNavTapped(int index) {
    // Panggil use case untuk navigasi ke halaman berdasarkan index
    _navigateToPageUseCase.execute(index);
  }
}
