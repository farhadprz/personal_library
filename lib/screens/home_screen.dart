import 'package:flutter/material.dart';
import 'package:personal_library/screens/add_book_screen.dart';
import 'package:personal_library/widgets/book_list_widget.dart';

import '../models/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> _books = []; //In Dart, a final variable means that the reference to the variable itself
  // cannot be reassigned after it has been initialized. However, if the final variable is a list,
  // you can still modify the contents of the list, including adding or removing objects.
  // This is because final affects the reference to the list, not the mutability of the list's contents.

  void _addBook(Book book) {
    setState(() {
      _books.add(book);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Library', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _books.isEmpty
          ? const Center(
              child: Text(
              'No books available, Add some books!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ))
          : BookListWidget(books: _books),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddBookScreen()));

          if(result != null){
            _addBook(result);
          }
        },
        backgroundColor: Colors.teal,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
