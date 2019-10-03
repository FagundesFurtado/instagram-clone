import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/pages/galery/galery_page.dart';

class GaleryModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => GaleryPage();

  static Inject get to => Inject<GaleryModule>.of();
}
