import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:instagram/app/models/DirectUser.dart';
import 'package:rxdart/subjects.dart';

class DirectBloc extends BlocBase {
  BehaviorSubject _messages = BehaviorSubject.seeded([
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
    DirectUser(
        username: "agatha",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        lastMessage: "Liked"),
  ]);

  List messagesDirect = [];

  Stream get outMessage => _messages.stream;
  Sink get _inMessage => _messages.sink;

  @override
  void dispose() {
    _messages.close();
    super.dispose();
  }
}
