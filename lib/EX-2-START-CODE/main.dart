import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repository/http_post_repository.dart';
import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
 

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: HttpPostRepository()),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
