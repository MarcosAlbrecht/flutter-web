import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;
  // Avoid self instance
  Env._();
  static Env get instance => _instance ??= Env._();

  Future<void> load() => dotenv.load();

  String? maybeGet(String key) => dotenv.maybeGet(key);

  String get(String key) => dotenv.get(key);
}
