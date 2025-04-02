import 'user.dart';
import '../utils/logger.dart';

class Admin extends User {
  Admin(super.username, super.bio);

  void deleteAnyPost(User user, int index) {
    if (index >= 0 && index < user.posts.length) {
      Logger.log(
        'Admin $username menghapus postingan pengguna ${user.username}.',
      );
      user.posts.removeAt(index);
    } else {
      throw Exception('Indeks postingan tidak valid.');
    }
  }
}
