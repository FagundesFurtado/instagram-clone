import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/app_bloc.dart';
import 'package:instagram/app/pages/camera/camera_module.dart';
import 'package:instagram/app/pages/direct/direct_module.dart';
import 'package:instagram/app/pages/feed/feed_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 1, keepPage: true);
  var bloc = BlocProvider.getBloc<AppBloc>();
  var listener;

  @override
  void initState() {
    super.initState();
    listener = bloc.outPages.listen((onData) {
      print("Listener Pages $onData");

      setState(() {
        if (mounted) {
          try {
            controller.animateToPage(onData,
                duration: Duration(milliseconds: 250), curve: Curves.linear);
          } catch (e) {
            print("erro no animate $e");
          }
        }
      });
    });
  }

  @override
  void dispose() {
    listener.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: <Widget>[CameraModule(), FeedModule(), DirectModule()],
    );
  }
}
