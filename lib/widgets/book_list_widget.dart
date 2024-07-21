import 'package:flutter/material.dart';
import 'package:personal_library/screens/book_details_screen.dart';

import '../models/book.dart';

class BookListWidget extends StatelessWidget {
  final List<Book> books;

  const BookListWidget({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookDetailsScreen(book: book)));
            },
          ),
        );
      },
      itemCount: books.length,
    );
  }
}
