class Post {
  String id;
  String username;
  String location;
  String urlPhoto;
  String subtitle;
  String userUrl;
  String userPhoto;
  int likes;
  bool liked;
  List<Comments> comments;

  Post(
      {this.id,
      this.username,
      this.location,
      this.urlPhoto,
      this.subtitle,
      this.userUrl,
      this.userPhoto,
      this.likes,
      this.liked,
      this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    location = json['location'];
    urlPhoto = json['url_photo'];
    subtitle = json['subtitle'];
    userUrl = json['user_url'];
    userPhoto = json['user_photo'];
    likes = json['likes'];
    liked = json['liked'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['location'] = this.location;
    data['url_photo'] = this.urlPhoto;
    data['subtitle'] = this.subtitle;
    data['user_url'] = this.userUrl;
    data['user_photo'] = this.userPhoto;
    data['likes'] = this.likes;
    data['liked'] = this.liked;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String username;

  Comments({this.username});

  Comments.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}