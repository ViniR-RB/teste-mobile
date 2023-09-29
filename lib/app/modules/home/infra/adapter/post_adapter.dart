import 'package:teste/app/modules/home/domain/entities/post.dart';

sealed class PostAdapter {
  static Post jsonFromEntity(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': final int id,
        'title': final String title,
        'body': final String body,
      } =>
        Post(id: id, title: title, body: body),
      _ => throw ArgumentError('Houve um Problem em Adaptar o json para post')
    };
  }
}
