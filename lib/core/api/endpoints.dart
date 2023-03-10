

class Endpoints {
  Endpoints._();

  /// base url
  /// todo - change this base url
  static const String baseUrl = 'http://localhost:5000';

  // auth endpoints
  static const generateOtp = 'auth/generateOTP';
  static const confirmOtp = 'auth/confirmOTP';
  static const login = 'auth/login';
  static const logout = 'auth/logout';

  static const notes = '/notes';
}
