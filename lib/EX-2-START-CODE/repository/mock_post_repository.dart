import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  
  final List<Post> _posts = [
    Post(id: 4, title: 'post 1', description: 'Description 1'),
    Post(id: 2, title: 'Post 2', description: 'Description 2'),
  ];

  @override
  Future<List<Post>> getPosts(){
    return Future.delayed(Duration(seconds: 5), () {
      if (_posts.isEmpty){
        throw Exception('No posts found');
      }
      return _posts;
    });
  }
}
