class CommentModel {

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body
  });

  factory CommentModel.toJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json['postId'], 
      id: json['id'], 
      name: json['name'], 
      email: json['email'], 
      body: json['body']
    );
  }
}

