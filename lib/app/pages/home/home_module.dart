import 'package:instagram/app/pages/camera/camera_bloc.dart';
import 'package:instagram/app/pages/direct/direct_bloc.dart';
import 'package:instagram/app/pages/feed/feed_bloc.dart';
import 'package:instagram/app/pages/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/pages/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
        Bloc((i) => FeedBloc()),
        Bloc((i) => CameraBloc()),
        Bloc((i) => DirectBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
