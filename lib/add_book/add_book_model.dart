import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_firestore/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;

  List<Book>? books;

  Future addBook() async {
    if(title == null){
      throw 'タイトルが入力されていません';
    }
    if(author == null){
      throw '著者が入力されていません';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('books').add({
      'title': title,
      'author': author,
    });
  }
}
