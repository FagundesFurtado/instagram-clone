import 'package:instagram/app/pages/galery/galery_bloc.dart';
import 'package:instagram/app/pages/conversation/conversation_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/app_widget.dart';
import 'package:instagram/app/pages/camera/camera_bloc.dart';
import 'package:instagram/app/pages/direct/direct_bloc.dart';
import 'package:instagram/app/pages/feed/feed_bloc.dart';
import 'package:instagram/app/pages/home/home_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GaleryBloc()),
        Bloc((i) => ConversationBloc()),
        Bloc((i) => HomeBloc()),
        Bloc((i) => FeedBloc()),
        Bloc((i) => CameraBloc()),
        Bloc((i) => DirectBloc()),
        Bloc((i) => ConversationBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
