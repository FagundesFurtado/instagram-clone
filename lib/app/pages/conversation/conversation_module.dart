import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/pages/conversation/conversation_page.dart';

class ConversationModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ConversationPage();

  static Inject get to => Inject<ConversationModule>.of();
}
