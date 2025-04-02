import 'account.dart';
import 'post.dart';
import '../utils/logger.dart';

class User extends Account {
  List<Post> posts = [];
  List<Post> likedPosts = [];

  User(super.username, super.bio);

  void addPost(Post post) {
    posts.add(post);
    Logger.log('$username menambahkan postingan: "${post.caption}".');
  }

  void likePost(Post post) {
    if (!likedPosts.contains(post)) {
      likedPosts.add(post);
      post.likePost();
      Logger.log('$username menyukai postingan: "${post.caption}"');
    } else {
      print('$username sudah menyukai postingan ini sebelumnya.');
    }
  }

  @override
  void checkStatus() {
    print('Profil: $username | Bio: $bio');
    print(
      'Postingan: ${posts.length} | Postingan yang disukai: ${likedPosts.length}',
    );
  }
}
