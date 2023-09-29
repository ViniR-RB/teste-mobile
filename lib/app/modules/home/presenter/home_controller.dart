import 'package:flutter/material.dart';
import 'package:teste/app/core/utils/either.dart';
import 'package:teste/app/modules/home/domain/entities/post.dart';
import 'package:teste/app/modules/home/presenter/states/home_states.dart';

import '../domain/error/get_all_post.dart';
import '../domain/usecases/get_all_posts_usecase.dart';

class HomeController {
  final GetAllPostsUsecase getAllPostsUsecase;

  final ValueNotifier<HomeState> _homeState = ValueNotifier(HomeStateInitial());
  HomeController({required this.getAllPostsUsecase});

  getAllPosts() async {
    _emitHomeState(HomeStateLoadingPosts());
    final result = await getAllPostsUsecase();
    switch (result) {
      case Sucess(:final List<Post> value):
        _emitHomeState(HomeStateLoadedPosts(posts: value));
      case Failure(:final GetAllPostError exception):
        _emitHomeState(HomeStateError(exception: exception));
    }
    return;
  }

  void _emitHomeState(HomeState state) {
    _homeState.value = state;
    return;
  }

  ValueNotifier<HomeState> get homeState => _homeState;
}
