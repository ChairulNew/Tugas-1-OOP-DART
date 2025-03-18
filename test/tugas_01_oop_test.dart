// Model untuk Pengguna
class User {
  String username;
  String bio;
  List<Post> posts = [];

  User(this.username, this.bio);

  void addPost(Post post) {
    posts.add(post);
    print('$username menambahkan postingan baru.');
  }
}

// Model untuk Postingan
class Post {
  String content;
  String caption;
  List<Comment> comments = [];
  int likes = 0;

  Post(this.content, this.caption);

  void addComment(Comment comment) {
    comments.add(comment);
    print('Komentar baru ditambahkan: ${comment.text}');
  }

  void likePost() {
    likes++;
    print('Postingan mendapat $likes like(s)');
  }
}

// Model untuk Komentar
class Comment {
  String text;
  String username;

  Comment(this.username, this.text);
}

// Sistem Utama (Simulasi Instagram)
void main() {
  // Buat pengguna
  User user1 = User('john_doe', 'Tech enthusiast & coder.');
  User user2 = User('jane_doe', 'Love photography and design.');

  // Buat postingan
  Post post1 = Post('Foto Sunset', 'Senja yang indah di pantai.');
  Post post2 = Post('Coding Setup', 'Meja kerja impian!');

  // Tambahkan postingan ke pengguna
  user1.addPost(post1);
  user2.addPost(post2);

  // Interaksi dengan postingan
  post1.likePost();
  post1.addComment(Comment('jane_doe', 'Wow, keren banget!'));

  post2.likePost();
  post2.addComment(Comment('john_doe', 'Meja kerja yang rapi!'));
}
