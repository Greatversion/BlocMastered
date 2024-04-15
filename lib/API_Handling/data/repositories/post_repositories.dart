import 'dart:async';
import 'dart:math';

import 'package:bloc_mastered/API_Handling/data/models/post_model.dart';
import 'package:bloc_mastered/API_Handling/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();
  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
   return postMaps.map((posts) => PostModel.fromJson(posts)).toList();
      // log(response.data);
    } catch (exception) {
      // ignore: use_rethrow_when_possible
      throw exception;
    }
  }
}
