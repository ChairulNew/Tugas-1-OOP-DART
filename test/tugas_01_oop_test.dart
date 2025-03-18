import 'dart:io';

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
  User user1 = User('john_doe', 'Tech enthusiast & coder.');
  User user2 = User('jane_doe', 'Love photography and design.');

  while (true) {
    print('\nPilih aksi:');
    print('1. Tambah Postingan');
    print('2. Like Postingan');
    print('3. Cek Status Pengguna');
    print('4. Keluar');

    String? pilihan = stdin.readLineSync();
    if (pilihan == '1') {
      print('Masukkan deskripsi postingan:');
      String? caption = stdin.readLineSync();
      print('Masukkan konten postingan:');
      String? content = stdin.readLineSync();

      if (caption != null && content != null) {
        Post newPost = Post(content, caption);
        user1.addPost(newPost);
      }
    } else if (pilihan == '2') {
      if (user1.posts.isNotEmpty) {
        print('Pilih postingan untuk di-like:');
        for (var i = 0; i < user1.posts.length; i++) {
          print('${i + 1}. ${user1.posts[i].caption}');
        }
        String? indexInput = stdin.readLineSync();
        int? index = int.tryParse(indexInput ?? '');
        if (index != null && index > 0 && index <= user1.posts.length) {
          user2.likePost(user1.posts[index - 1]);
        } else {
          print('Pilihan tidak valid.');
        }
      } else {
        print('Belum ada postingan untuk di-like.');
      }
    } else if (pilihan == '3') {
      user1.checkStatus();
      user2.checkStatus();
    } else if (pilihan == '4') {
      print('Terima kasih telah menggunakan Instagram Simulasi!');
      break;
    } else {
      print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
