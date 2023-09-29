import 'package:teste/app/modules/home/domain/entities/post.dart';

import '../../../../core/utils/either.dart';
import '../error/get_all_post.dart';

abstract interface class GetAllPostsRepository {
  Future<Either<GetAllPostError, List<Post>>> getAllTodos();
}
