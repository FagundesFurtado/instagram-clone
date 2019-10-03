import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/models/Post.dart';
import 'package:instagram/app/pages/feed/feed_bloc.dart';
import 'package:instagram/app/pages/galery/galery_module.dart';

import '../../app_bloc.dart';

class FeedPage extends StatelessWidget {
  final bloc = BlocProvider.getBloc<FeedBloc>();
  final mainBloc = BlocProvider.getBloc<AppBloc>();
  final sizeIcon = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              height: sizeIcon,
              width: sizeIcon,
              child: Image.asset("assets/igtv.png"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: mainBloc.moveToDirect,
            child: Container(
              height: sizeIcon,
              width: sizeIcon,
              child: Image.asset("assets/direct.png"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            mainBloc.moveToCamera();
          },
          icon: GestureDetector(
            child: Container(
              height: sizeIcon,
              width: sizeIcon,
              child: Image.asset("assets/camera.png"),
            ),
          ),
        ),
        title: Text(
          "Instagram",
          style: TextStyle(
              fontFamily: "Billabong", color: Colors.black, fontSize: 25),
        ),
      ),
      body: StreamBuilder(
          initialData: [],
          stream: bloc.outFeed,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (var i in snapshot.data) photos(i),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            );
          }),
      bottomSheet: bottomBar(context),
    );
  }
}

Widget bottomBar(BuildContext context) {
  double tamanhoIcones = 30;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.home,
          size: tamanhoIcones,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.search, size: tamanhoIcones),
        onPressed: () {},
      ),
      IconButton(
        icon: Image.asset(
          "assets/more.png",
          height: tamanhoIcones,
          width: tamanhoIcones,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GaleryModule()));
        },
      ),
      IconButton(
        icon: Image.asset(
          "assets/like.png",
          height: tamanhoIcones,
          width: tamanhoIcones,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.home),
        onPressed: () {},
      ),
    ],
  );
}

Widget photos(Post post) {
  var bloc = BlocProvider.getBloc<FeedBloc>();

  print("Legenda ${post.subtitle}");

  return Container(
    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: 25,
                  height: 25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(post.userPhoto),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      post.username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post.location,
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
            Icon(Icons.more_vert)
          ],
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onDoubleTap: () => bloc.photoLiked(post),
          child: Container(
            // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Image.network(post.urlPhoto),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => bloc.photoLiked(post),
                    child: Container(
                      width: 30,
                      height: 30,
                      child: post.liked
                          ? Image.asset("assets/liked.png")
                          : Image.asset("assets/like.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      "assets/comment.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("assets/direct.png"),
                  )
                ],
              ),
              Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/save.png"),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            "${post.likes} curtidas",
            textAlign: TextAlign.left,
          ),
        ),
        if (post.subtitle != null)
          Container(
            padding: EdgeInsets.only(left: 10),
            width: 500,
            height: 50,
            child: RichText(
              text: TextSpan(
                  text: post.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                        text: post.subtitle,
                        style: TextStyle(fontWeight: FontWeight.normal))
                  ]),
            ),
          )
      ],
    ),
  );
}
