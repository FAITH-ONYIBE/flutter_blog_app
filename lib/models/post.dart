class Post {
  final int id;
  final String title;
  final String body;
  final String imageUrl;   
  final String author;     
  final String time;       

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.author,
    required this.time,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final int id = json['id'];
    return Post(
      id: id,
      title: json['title'],
      body: json['body'],
      imageUrl: "https://picsum.photos/id/${id % 100}/600/300", // Unique image per post
      author: json['author'] ?? "Unknown",
      time: json['time'] ?? "5 min",
    );
  }
}
