/* Class chứa thông tin về 1 News */
class News {
  final String title;
  final String content;
  final String imageUrl;
  final DateTime publishedAt;

  News({
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.publishedAt,
  });
}
