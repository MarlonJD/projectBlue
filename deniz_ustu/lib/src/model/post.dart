import 'dart:convert';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      userId: map["userId"],
      id: map["id"],
      title: map["title"],
      body: map["body"]
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {"userId": userId, "id": id, "title": title, "body": body};
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id}';
  }
}

Post postFromJson(String jsonData) {
  final data = json.decode(jsonData);
  Post post = new Post.fromJson(data["results"][0]);
  return post;
}

String postToJson(Post data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}