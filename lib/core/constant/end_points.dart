class AppEndPoints {
  static const String baseUrl = 'http://finemenu.net:8000/api/';
  static String restaurantWithId(int id) => 'webapp/restaurant/$id';
  static const String login = 'auth/login';
  static const String update = 'update';
  static const String sendcode = 'auth/send-code';
  static const String validatecode = 'auth/validate-code';
}
