class DirectUser {
  String username;
  String userPhoto;
  String lastMessage;

  DirectUser({this.username, this.userPhoto, this.lastMessage});

  DirectUser.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userPhoto = json['user_photo'];
    lastMessage = json['last_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['user_photo'] = this.userPhoto;
    data['last_message'] = this.lastMessage;
    return data;
  }
}