import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('本一覧'),
        ),

        body: Center(
          child: Consumer<AddBookModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                TextField(
                  decoration: const InputDecoration(
                      // border: InputBorder.none,
                      hintText: 'title'),
                  onChanged: (text) {
                    model.title = text;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                      // border: InputBorder.none,
                      hintText: 'author'),
                  onChanged: (text) {
                    model.author = text;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        await model.addBook();
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text(e.toString())
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: child),
              ]),
            );
          }),
        ),
        // floatingActionButton: const FloatingActionButton(
        //   onPressed: null,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}
