import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app/app_bloc.dart';
import 'package:instagram/app/models/DirectUser.dart';
import 'package:instagram/app/pages/conversation/conversation_module.dart';

import 'direct_bloc.dart';

class DirectPage extends StatefulWidget {
  @override
  _DirectPageState createState() => _DirectPageState();
}

class _DirectPageState extends State<DirectPage> {
  var bloc = BlocProvider.getBloc<DirectBloc>();
  var mainBloc = BlocProvider.getBloc<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: mainBloc.moveToFeed,
          child: Container(
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Text("username"),
      ),
      body: StreamBuilder(
        initialData: [],
        stream: bloc.outMessage,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                for (DirectUser i in snapshot.data) directMessage(i),
                SizedBox(
                  height: 45,
                )
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        height: 45,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 240, 240, 240),
            border: Border(top: BorderSide(width: 1))),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(3),
        child: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/camera.png"),
              ),
              SizedBox(
                width: 5,
              ),
              Text("Câmera")
            ],
          ),
        ),
      ),
    );
  }

  Widget directMessage(DirectUser message) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ConversationModule()));
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              width: 55,
              height: 55,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: Image.network(message.userPhoto),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(message.username),
                SizedBox(
                  height: 3,
                ),
                Text(
                  message.lastMessage,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
