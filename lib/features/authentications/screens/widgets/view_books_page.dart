import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/add_book_page.dart';
import 'package:project_2tamayoz/features/authentications/screens/widgets/add_zady_session_page.dart';
import 'package:project_2tamayoz/models/get_books_model.dart';
import 'package:project_2tamayoz/services/get_books_service.dart';

class ViewBooksPage extends StatefulWidget {
  const ViewBooksPage({super.key});

  @override
  State<ViewBooksPage> createState() => _ViewBooksPageState();
}

class _ViewBooksPageState extends State<ViewBooksPage> {
  // Sample list of books

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
        child: FutureBuilder<GetBooksModel>(
          future: GetBooksService().getBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
              return const Center(
                child: Text('There Is No Books.'),
              );
            } else {
              GetBooksModel getBooksModel = snapshot.data!;
              return ListView.builder(
                itemCount: getBooksModel.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                        onTap: () {
                          Get.to(
                            () => AddZadySessionPage(),
                            arguments: getBooksModel.data[index].id,
                          );
                        },
                        child: ListTile(
                          leading: getBooksModel
                                  .data[index].imageName.isNotEmpty
                              ? getBooksModel.data[index].imageName
                                      .startsWith('http')
                                  ? Image.network(
                                      getBooksModel.data[index].imageName,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(getBooksModel.data[index].imageName),
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )
                              : Icon(Icons.book,
                                  size: 50), // Default icon if no image
                          title: Text('${getBooksModel.data[index].title}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Author: ${getBooksModel.data[index].author}'),
                              Text(
                                'Date: ${getBooksModel.data[index].createdAt}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookPage(onBookAdded: () {
                setState(() {});
              }),
            ),
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
