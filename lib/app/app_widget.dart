import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/app_bloc.dart';
import 'package:instagram/app/pages/camera/camera_bloc.dart';
import 'package:instagram/app/pages/direct/direct_bloc.dart';
import 'package:instagram/app/pages/feed/feed_bloc.dart';
import 'package:instagram/app/pages/home/home_bloc.dart';
import 'package:instagram/app/pages/home/home_module.dart';

class AppWidget extends StatelessWidget {

  static const int _blackPrimaryValue = 0xFFFFFFFF;

  static const MaterialColor primaryWhite = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(_blackPrimaryValue),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => AppBloc()),
        Bloc((i) => HomeBloc()),
        Bloc((i) => FeedBloc()),
        Bloc((i) => CameraBloc()),
        Bloc((i) => DirectBloc()),
      ],
      child: MaterialApp(
        title: 'Instagram',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primaryWhite,
        ),
        home: HomeModule(),
      ),
    );
  }
}
