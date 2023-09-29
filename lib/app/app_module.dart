import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/modules/home/domain/usecases/get_all_posts_usecase.dart';
import 'package:teste/app/modules/home/external/datasource/json_placeholder_post.dart';
import 'package:teste/app/modules/home/home_page.dart';
import 'package:teste/app/modules/home/infra/datasource/get_posts_data_source.dart';
import 'package:teste/app/modules/home/infra/repositories/get_all_posts_repository_impl.dart';
import 'package:teste/app/modules/home/presenter/home_controller.dart';

import 'modules/home/domain/repositories/get_all_post.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  void binds(Injector i) {
    // Presenter
    i.addSingleton(HomeController.new);
    // Domain
    i.addSingleton(GetAllPostsUsecase.new);
    i.addSingleton<GetAllPostsRepository>(GetAllPostsRepositoryImpl.new);
    // Infra
    i.addSingleton<GetPostsDataSource>(JsonPlaceholderPostImpl.new);

    // External
    i.addSingleton(() =>
        Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')));
  }

  @override
  void exportedBinds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => HomePage(controller: Modular.get()));
  }
}
