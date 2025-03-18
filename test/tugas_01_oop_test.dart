// Model untuk Pengguna
class User {
  String username;
  String bio;
  List<Post> posts = [];
  List<Post> likedPosts = [];

  User(this.username, this.bio);

  void addPost(Post post) {
    posts.add(post);
    print('$username menambahkan postingan baru: "${post.caption}".');
  }

  void likePost(Post post) {
    if (!likedPosts.contains(post)) {
      likedPosts.add(post);
      post.likePost();
      print('$username menyukai postingan: "${post.caption}"');
    } else {
      print('$username sudah menyukai postingan ini sebelumnya.');
    }
  }

  void checkStatus() {
    print('Profil: $username | Bio: $bio');
    print(
      'Postingan: ${posts.length} | Postingan yang disukai: ${likedPosts.length}',
    );
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
    print(
      'Komentar baru ditambahkan oleh ${comment.username}: "${comment.text}"',
    );
  }

  void likePost() {
    likes++;
    print('Postingan "$caption" mendapat $likes like(s)');
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
  User user1 = User('Chairul Arul', 'Tech enthusiast & coder.');
  User user2 = User('Renanta Namoura', 'Love photography and design.');

  // Buat postingan
  Post post1 = Post('Coding with me', 'Senja yang indah di pantai.');
  Post post2 = Post('Sunset yang indah', 'Meja kerja impian!');

  // Tambahkan postingan ke pengguna
  user1.addPost(post1);
  user2.addPost(post2);

  // Interaksi dengan postingan
  user1.likePost(post1);
  user2.likePost(post1);
  user2.likePost(post1); // Tes double like

  post1.addComment(Comment('jane_doe', 'Wow, keren banget!'));
  post2.addComment(Comment('john_doe', 'Meja kerja yang rapi!'));

  // Cek status pengguna
  user1.checkStatus();
  user2.checkStatus();
}
