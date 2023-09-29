import 'package:teste/app/modules/home/domain/entities/post.dart';

sealed class HomeState {}

final class HomeStateInitial implements HomeState {}

final class HomeStateLoadingPosts implements HomeState {}

class HomeStateLoadedPosts implements HomeState {
  final List<Post> posts;
  HomeStateLoadedPosts({required this.posts});
}

final class HomeStateEmptyPost extends HomeStateLoadedPosts {
  HomeStateEmptyPost() : super(posts: []);
}

final class HomeStateError implements HomeState {
  final Exception exception;
  HomeStateError({required this.exception});
}
