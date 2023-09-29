import 'package:dio/dio.dart';
import 'package:teste/app/modules/home/domain/entities/post.dart';

import '../../infra/adapter/post_adapter.dart';
import '../../infra/datasource/get_posts_data_source.dart';

class JsonPlaceholderPostImpl implements GetPostsDataSource {
  final Dio dio;
  JsonPlaceholderPostImpl({required this.dio});
  @override
  Future<List<Post>> getAllPosts() async {
    final Response<List<dynamic>>(:data) = await dio.get('/posts');
    final posts = data!.map((e) => PostAdapter.jsonFromEntity(e)).toList();
    return posts;
  }
}
