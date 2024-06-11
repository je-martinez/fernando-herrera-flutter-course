import 'package:flutter_dotenv/flutter_dotenv.dart';

const String defaultValue = 'Missing Env Variable';

enum EnvironmentKeys {
// ignore: constant_identifier_names
  THE_MOVIEDB_KEY,
}

class Environment {
  static final String movieDBKey =
      dotenv.env[EnvironmentKeys.THE_MOVIEDB_KEY.name] ?? defaultValue;
}
