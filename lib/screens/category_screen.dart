import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/category_product_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot category = snapshot.data!.docs[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: ListTile(
                leading: Icon(Icons.category, color: Colors.amber[800]),
                title: Text(
                  category['name'],
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryProductScreen(
                        categoryId: category.id,
                        categoryName: category['name'],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
