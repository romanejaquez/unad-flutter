import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unad_app/models/comment.dart';
import 'dart:convert' as convert;

import 'package:unad_app/models/post.dart';

// EJEMPLO DE COMO HACER LLAMADAS REST A UN API EXTERNO
class ProxyService {

  static Future<List<CommentModel>> getPosts() async {
    List<CommentModel> posts = [];
    Completer<List<CommentModel>> postCompleter = Completer();
    
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');

    http.get(url).then((response) {

      List<dynamic> parsedJSON = convert.jsonDecode(response.body);

      if (response.statusCode == 200 && parsedJSON.length > 0) {

        for (var post in parsedJSON) {
          posts.add(CommentModel.toJson(post));
        }

        postCompleter.complete(posts);
      }
      else {
        postCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }

    }).onError((error, stackTrace) {
      postCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    })
    .catchError((error) {
      postCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });

    return postCompleter.future;
  }

  static Future<List<PostModel>> sendPost() async {
    List<PostModel> posts = [];
    Completer<List<PostModel>> postCompleter = Completer();
    
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var post = PostModel(id: 1, userId: 2, title: "title", body: "body").toMap();

    http.post(url, 
      body: convert.jsonEncode(post)
    ).then((response) {

      Map<String, dynamic> parsedJSON = convert.jsonDecode(response.body);

      if ((response.statusCode == 200 || response.statusCode == 201) && parsedJSON.length > 0) {

        for (var post in parsedJSON.entries) {
          
        }

        postCompleter.complete(posts);
      }
      else {
        postCompleter.completeError(
          const AsyncSnapshot.withError(ConnectionState.done, 'error')
        );
      }

    }).onError((error, stackTrace) {
      postCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    })
    .catchError((error) {
      postCompleter.completeError(
        const AsyncSnapshot.withError(ConnectionState.done, 'error')
      );
    });

    return postCompleter.future;
  }
}