final class AppUrls {
  String get base => 'https://ez-train.vercel.app';

  String get authApi => '$base/auth';

  String get register => '$authApi/register';

  String get login => '$authApi/login';
}
