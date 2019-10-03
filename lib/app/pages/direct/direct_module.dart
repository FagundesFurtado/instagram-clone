import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/pages/direct/direct_bloc.dart';
import 'package:instagram/app/pages/direct/direct_page.dart';

class DirectModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => DirectBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => DirectPage();

  static Inject get to => Inject<DirectModule>.of();
}
