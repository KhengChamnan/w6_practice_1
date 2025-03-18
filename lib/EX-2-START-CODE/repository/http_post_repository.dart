import 'dart:convert';

import 'post_repository.dart';
import '../model/post.dart';
import 'package:http/http.dart' as http;
import '../model/dtos/post_dto.dart';

class HttpPostRepository extends PostRepository {
  //convet json to postdto object then to post object 
  Post fromJson(Map<String, dynamic> json) {
    final postDTO = PostDTO.fromJson(json);
    return Post(
      id: postDTO.id,
      title: postDTO.title,
      description: postDTO.body,
    );
  }

  @override
  Future<List<Post>> getPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    //code 200 mean success
    if (response.statusCode == 200) {
      //reponse.body is json string using dart convert func json.decode to convert it to list of dynamic
      final List<dynamic> jsonData = json.decode(response.body);
      //using the map func iterate over jsondata and using fromjson func to convert into a list of post object
      return jsonData.map((json) => fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
