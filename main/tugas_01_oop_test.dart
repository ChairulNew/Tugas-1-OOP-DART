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
  List<User> users = [];
  User? currentUser;

  while (true) {
    print('\nPilih aksi:');
    print('1. Login');
    print('2. Register');
    print('3. Keluar');

    String? pilihan = stdin.readLineSync();
    if (pilihan == '1') {
      print('Masukkan username untuk login:');
      String? username = stdin.readLineSync();

      currentUser = users.firstWhere(
        (user) => user.username == username,
        orElse: () => User('', ''),
      );

      if (currentUser.username == '') {
        print('Username tidak ditemukan. Silakan coba lagi.');
      } else {
        print('Berhasil login sebagai $username');
        break;
      }
    } else if (pilihan == '2') {
      print('Masukkan username untuk register:');
      String? username = stdin.readLineSync();

      print('Masukkan bio Anda:');
      String? bio = stdin.readLineSync();

      User newUser = User(username ?? '', bio ?? '');
      users.add(newUser);

      print('Berhasil register sebagai $username');
      currentUser = newUser;
      break;
    } else if (pilihan == '3') {
      print('Terima kasih telah menggunakan Instagram Simulasi!');
      break;
    } else {
      print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }

  while (true) {
    if (currentUser == null) {
      print('Anda harus login terlebih dahulu.');
      break;
    }

    print('\nPilih aksi:');
    print('1. Tambah Postingan');
    print('2. Like Postingan');
    print('3. Cek Status Pengguna');
    print('4. Logout');
    print('5. Keluar');

    String? pilihan = stdin.readLineSync();
    if (pilihan == '1') {
      print('Masukkan deskripsi postingan:');
      String? caption = stdin.readLineSync();
      print('Masukkan konten postingan:');
      String? content = stdin.readLineSync();

      if (caption != null && content != null) {
        Post newPost = Post(content, caption);
        currentUser.addPost(newPost);
      }
    } else if (pilihan == '2') {
      if (currentUser.posts.isNotEmpty) {
        print('Pilih postingan untuk di-like:');
        for (var i = 0; i < currentUser.posts.length; i++) {
          print('${i + 1}. ${currentUser.posts[i].caption}');
        }
        String? indexInput = stdin.readLineSync();
        int? index = int.tryParse(indexInput ?? '');
        if (index != null && index > 0 && index <= currentUser.posts.length) {
          // Perbaiki ini dengan mengembalikan user lain jika ada
          User otherUser = users.firstWhere(
            (user) => user != currentUser,
            orElse:
                () =>
                    users
                        .first, // Mengembalikan user pertama yang valid jika tidak ada user lain
          );
          otherUser.likePost(currentUser.posts[index - 1]);
        } else {
          print('Pilihan tidak valid.');
        }
      } else {
        print('Belum ada postingan untuk di-like.');
      }
    } else if (pilihan == '3') {
      currentUser.checkStatus();
    } else if (pilihan == '4') {
      print('Logout berhasil.');
      currentUser = null;
      break;
    } else if (pilihan == '5') {
      print('Terima kasih telah menggunakan Instagram Simulasi!');
      break;
    } else {
      print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
