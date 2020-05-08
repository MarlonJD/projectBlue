import 'dart:convert';

class Post {
  int userId;
  int id;

  Post({this.userId, this.id});

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      userId: map["userId"],
      id: map["id"]
    );
  }

  Map<String, dynamic> toJson() {
    return {"userId": userId, "id": id};
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id}';
  }
}

List<Post> postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Post>.from(data.map((item) => Post.fromJson(item)));
}

String postToJson(Post data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
