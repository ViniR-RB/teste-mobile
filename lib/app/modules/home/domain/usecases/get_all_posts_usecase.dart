import 'package:teste/app/modules/home/domain/repositories/get_all_post.dart';

import '../../../../core/utils/either.dart';
import '../entities/post.dart';
import '../error/get_all_post.dart';

class GetAllPostsUsecase {
  final GetAllPostsRepository repository;

  GetAllPostsUsecase({required this.repository});

  Future<Either<GetAllPostError, List<Post>>> call() async {
    return await repository.getAllTodos();
  }
}
