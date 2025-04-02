import 'comment.dart';
import '../utils/logger.dart';

class Post {
  String content;
  String caption;
  List<Comment> comments = [];
  int likes = 0;

  Post(this.content, this.caption);

  void addComment(Comment comment) {
    comments.add(comment);
    Logger.log('Komentar baru oleh ${comment.username}: "${comment.text}"');
  }

  void likePost() {
    likes++;
    Logger.log('Postingan "$caption" mendapat $likes like(s)');
  }
}
