import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:instagram/app/models/Post.dart';
import 'package:rxdart/subjects.dart';

class FeedBloc extends BlocBase {
  BehaviorSubject _photos = BehaviorSubject.seeded([]);

  Stream get outFeed => _photos.stream;
  Sink get _sinkFeed => _photos.sink;

  FeedBloc() {
    _sinkFeed.add(_posts);
  }

  List<Post> _posts = [
    Post(
        id: "asihasd",
        likes: 10,
        username: "agatha",
        location: "São Paulo",
        liked: true,
        subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem",
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/ec3b035a1e3e59f8c9619830d526f024/5E39B0E8/t51.2885-19/s150x150/66828857_498736760876049_5233722459710029824_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        urlPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/e28cd2a78649e1b368175df7b84c4c39/5E29DD46/t51.2885-15/e35/p1080x1080/69853358_2411250442464692_520255273791204825_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net&_nc_cat=108"),
    Post(
        id: "jashjasj",
        likes: 10,
        username: "biigodegrossoo",
        location: "",
        liked: false,
        userPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/5714881dd236a19181eea2923a5f466b/5E3D0613/t51.2885-19/s150x150/69975455_2502283536527504_5399675546441351168_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net",
        urlPhoto:
            "https://instagram.fpoo1-1.fna.fbcdn.net/vp/4e3b20018dede395f9b3e3e58df7f901/5E3DC3C0/t51.2885-15/e35/72399256_492772357969069_6262860084898549869_n.jpg?_nc_ht=instagram.fpoo1-1.fna.fbcdn.net&_nc_cat=101"),
  ];

  void photoLiked(Post post) {
    for (Post p in _posts) {
      if (p.id == post.id) {
        if (!p.liked) {
          p.likes++;
        } else {
          p.likes--;
        }
        p.liked = !p.liked;
      }
    }

    _sinkFeed.add(_posts);

    print("like photo");
  }

  @override
  void dispose() {
    _photos.close();
    super.dispose();
  }
}
