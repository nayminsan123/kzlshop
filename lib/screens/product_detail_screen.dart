import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  final DocumentSnapshot product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productData = product.data() as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          productData != null && productData.containsKey('name')
              ? productData['name']
              : 'Product Details',
          style: GoogleFonts.lato(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image
            SizedBox(
              height: 300,
              child: Image.network(
                productData != null && productData.containsKey('imageUrl')
                    ? productData['imageUrl']
                    : '',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Icon(Icons.broken_image, size: 150, color: Colors.grey));
                },
              ),
            ),
            const SizedBox(height: 20),

            // Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                productData != null && productData.containsKey('name')
                    ? productData['name']
                    : 'No Name',
                style: GoogleFonts.oswald(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Product Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                productData != null && productData.containsKey('price')
                    ? '\$${productData['price']}'
                    : '\$0.00',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Product Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productData != null && productData.containsKey('description')
                    ? productData['description']
                    : 'No description available.',
                style: GoogleFonts.openSans(fontSize: 16, height: 1.5),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // TODO: Implement Add to Cart functionality
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to cart!')),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text('Add to Cart'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            textStyle: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
