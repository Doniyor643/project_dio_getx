
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;
  Dio dio = Dio();
  String url = "http://jsonplaceholder.typicode.com";

  Future<List?> getResponse()async{
    isLoading(true);
    var response = await dio.get("$url/posts");
    if(response.statusCode == 200){
      print("Response = $response");
      isLoading(false);
      items.value = (response.data as List)
          .map((e) => Post.fromJson(e))
          .toList();
      return items;
    }else{
      print("Error");
    }
    return null;
  }

  Future<bool> createNewUser(String text, String body)async{

    var response = await dio.post('/posts',data: {'title':text,'body':body});

    return response.statusCode == 201;
  }

  Future<bool> renameUser(Post post)async{
    var response = await dio.put('/posts/${post.id}',data: {'title':post.title,'body':post.body});
    return (response.statusCode == 201 || response.statusCode == 200);
  }

  Future<bool> deleteUser(Post post)async{
    var response = await dio.post('/posts/${post.id}');
    return response.statusCode == 201;
  }
}