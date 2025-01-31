import 'package:flutter/material.dart';
import 'package:apps/core/api/api_service.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';
import '../../domain/entities/blog.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage(this.controller);

  final List<Map<String, String>> vrProducts = [
    {
      'name': 'Meta Quest 2',
      'image':
          'https://th.bing.com/th/id/OIP.M7aEMtrMdqIm84D3mUciQgHaHa?rs=1&pid=ImgDetMain', // Ganti URL gambar
      'description':
          'High-performance VR headset with great comfort and features.',
      'price': '\$299'
    },
    {
      'name': 'PlayStation VR',
      'image':
          'https://http2.mlstatic.com/oculos-3d-samsung-gear-vr-virtual-reality-headset-D_NQ_NP_114311-MLB20541370872_012016-F.jpg', // Ganti URL gambar
      'description': 'The best VR experience for PlayStation gamers.',
      'price': '\$399'
    },
    {
      'name': 'HTC Vive Pro 2',
      'image':
          'https://png.pngtree.com/thumb_back/fh260/background/20220314/pngtree-vr-product-photography-black-and-white-image_1055042.jpg', // Ganti URL gambar
      'description':
          'Premium VR headset with high-resolution display and comfort.',
      'price': '\$799'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return BasePage(
      bodyContent: FutureBuilder<List<Blog>>(
        future: apiService.fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 50, color: Colors.red),
                  const SizedBox(height: 10),
                  Text('Error: ${snapshot.error}', textAlign: TextAlign.center),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No blogs found',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          } else {
            final blogs = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Bagian untuk Blog
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: blogs.length,
                    itemBuilder: (context, index) {
                      final blog = blogs[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(
                            blog.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                blog.content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Created at: ${blog.createdAt}',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            // Placeholder for blog detail navigation
                          },
                        ),
                      );
                    },
                  ),

                  // Divider for section separation
                  const Divider(height: 40, thickness: 2),

                  // Bagian untuk produk VR
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: vrProducts.length,
                    itemBuilder: (context, index) {
                      final product = vrProducts[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                product['image']!,
                                height: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 200,
                                    color: Colors.grey[300],
                                    child: Center(
                                        child: Text('Image not available')),
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              Text(
                                product['name']!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                product['description']!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product['price']!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Placeholder for product details or purchase page
                                    },
                                    child: Text('View Details'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }
}
