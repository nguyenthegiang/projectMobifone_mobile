//Class này để tạo 1 Exception có thể tung ra nếu có lỗi liên quan đến Server
class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() {
    // return super.toString();  //Instance of HttpException

    return message;
  }
}
