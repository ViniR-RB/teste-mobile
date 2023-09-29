import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:teste/app/core/utils/either.dart';
import 'package:teste/app/modules/home/domain/entities/post.dart';
import 'package:teste/app/modules/home/domain/error/get_all_post.dart';

import '../../domain/repositories/get_all_post.dart';
import '../datasource/get_posts_data_source.dart';

class GetAllPostsRepositoryImpl implements GetAllPostsRepository {
  final GetPostsDataSource datasource;

  GetAllPostsRepositoryImpl({required this.datasource});
  @override
  Future<Either<GetAllPostError, List<Post>>> getAllTodos() async {
    try {
      final result = await datasource.getAllPosts();
      return Sucess(result);
    } on DioException catch (e, s) {
      log('Problemas com Requisição', error: e, stackTrace: s);
      return Failure(
          exception:
              GetAllPostError('Houve um Erro com a internet tente novamente'));
    } on ArgumentError catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return Failure(exception: GetAllPostError(e.toString()));
    } catch (e, s) {
      log('Erro inesperado', error: e, stackTrace: s);
      return Failure(exception: GetAllPostError('Houve um erro inesperado', s));
    }
  }
}
