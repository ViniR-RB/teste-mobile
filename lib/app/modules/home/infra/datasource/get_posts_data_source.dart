import 'package:teste/app/modules/home/domain/entities/post.dart';

abstract interface class GetPostsDataSource {
  Future<List<Post>> getAllPosts();
}
