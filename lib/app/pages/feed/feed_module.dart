import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/pages/feed/feed_page.dart';

import 'feed_bloc.dart';

class FeedModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => FeedBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => FeedPage();

  static Inject get to => Inject<FeedModule>.of();
}
