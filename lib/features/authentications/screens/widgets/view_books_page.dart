import 'package:flutter/material.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/add_book_page.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/add_zady_session_page.dart';

class Book {
  final String title;
  final String author;
  final String date;
  final String imagePath;

  Book({
    required this.title,
    required this.author,
    required this.date,
    required this.imagePath,
  });
}

class ViewBooksPage extends StatefulWidget {
  const ViewBooksPage({super.key});

  @override
  State<ViewBooksPage> createState() => _ViewBooksPageState();
}

class _ViewBooksPageState extends State<ViewBooksPage> {
  // Sample list of books
  final List<Book> books = [
    Book(
      title: "Book 1",
      author: "Author 1",
      date: "2024-08-10",
      imagePath: "assets/images/download33.jpeg",
    ),
    Book(
      title: "Book 2",
      author: "Author 2",
      date: "2023-07-15",
      imagePath: "assets/images/download33.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f5fa),
      appBar: AppBar(
        backgroundColor: Color(0xffE4C9E5),
        title: const Text(
          'The Books',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddZadySessionPage()),
                  );
                },
                child: ListTile(
                  leading: book.imagePath.isNotEmpty
                      ? Image.asset(
                          book.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Icon(Icons.book, size: 50), // Default icon if no image
                  title: Text(book.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Author: ${book.author}'),
                      Text('Date: ${book.date}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBookPage()),
          );
        },
        tooltip: 'Add Book',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewBooksPage(),
  ));
}
