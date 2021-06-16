class Board {
  Board({
    required this.documentID,
    required this.boardID,
    required this.email,
    required this.name,
    this.nickname,
    required this.title,
    this.contents,
    this.createdate,
  });

  Board.fromJson(Map<String, Object?> json)
      : this(
          documentID: json['documentID']! as String,
          boardID: json['boardID']! as String,
          email: json['email']! as String,
          name: json['name']! as String,
          nickname: json['nickname'] as String,
          title: json['title']! as String,
          contents: json['contents'] as String,
          createdate: json['createdate'] as String,
        );

  final String documentID;
  final String boardID;
  final String email;
  final String name;
  final String? nickname;
  final String title;
  final String? contents;
  final String? createdate;

  Map<String, Object?> toJson() {
    return {
      'documentID': documentID,
      'boardID': boardID,
      'email': email,
      'name': name,
      'nickname': nickname,
      'title': title,
      'contents': contents,
      'createdate': createdate,
    };
  }
}
