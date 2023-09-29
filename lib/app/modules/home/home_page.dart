import 'package:flutter/material.dart';
import 'package:teste/app/modules/home/presenter/home_controller.dart';
import 'package:teste/app/modules/home/presenter/states/home_states.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.maybeSizeOf(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.controller.homeState,
        builder: (context, value, child) {
          return switch (value) {
            HomeStateInitial() => const SizedBox.shrink(),
            HomeStateLoadingPosts() =>
              const Center(child: CircularProgressIndicator()),
            HomeStateLoadedPosts() => SizedBox(
                height: size.height,
                width: size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(value.posts[index].title),
                  ),
                  itemCount: value.posts.length,
                ),
              ),
            HomeStateError() => Center(
                child: Text(value.exception.toString()),
              )
          };
        },
      ),
    );
  }
}
