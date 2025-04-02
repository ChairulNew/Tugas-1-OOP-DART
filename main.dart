import 'dart:io';
import 'models/user.dart';
import 'models/admin.dart';
import 'models/post.dart';
import 'models/comment.dart';

void main() {
  List<User> users = [];
  User? currentUser;

  while (true) {
    print('\nPilih aksi:\n1. Login\n2. Register\n3. Keluar');
    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      print('Masukkan username untuk login:');
      String? username = stdin.readLineSync();

      try {
        currentUser = users.firstWhere((user) => user.username == username);
        print('Berhasil login sebagai $username');
        break;
      } catch (e) {
        print('Username tidak ditemukan. Silakan coba lagi.');
      }
    } else if (pilihan == '2') {
      print('Masukkan username untuk register:');
      String? username = stdin.readLineSync();
      print('Masukkan bio Anda:');
      String? bio = stdin.readLineSync();

      if (username != null && bio != null) {
        User newUser = User(username, bio);
        users.add(newUser);
        print('Berhasil register sebagai $username');
        currentUser = newUser;
        break;
      } else {
        print('Username atau bio tidak boleh kosong.');
      }
    } else if (pilihan == '3') {
      print('Terima kasih telah menggunakan Instagram Simulasi!');
      return;
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
          currentUser.likePost(currentUser.posts[index - 1]);
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
      return;
    } else {
      print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
