import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Typed access to environment configuration.
///
/// Resolution order for every value:
///   1. `--dart-define` / `--dart-define-from-file` (compile-time, preferred
///      for per-environment builds and CI)
///   2. the bundled `dotenv` asset loaded in `main()` (local default)
///
/// Steps to use `--dart-define-from-file`:
///   1. Create `env/dev.json` (gitignore `env/*.json`, commit only an
///      `env/example.json`):
///        { "BASE_URL": "https://api.example.com/api/" }
///   2. Run:    flutter run --dart-define-from-file=env/dev.json
///      Build:  flutter build apk --dart-define-from-file=env/prod.json
///   3. VS Code: add to launch.json -> "args":
///        ["--dart-define-from-file=env/dev.json"]
///   4. To add a new key, declare a `const String.fromEnvironment('KEY')`
///      below (it must be a literal `const` so the compiler can substitute
///      it) and a getter that calls `_read`.
///
/// Note: values in the `dotenv` asset ship inside the app bundle and can be
/// extracted — never put secrets in it.
abstract final class Env {
  static const String _baseUrlDefine = String.fromEnvironment('BASE_URL');

  static String get baseUrl => _read('BASE_URL', _baseUrlDefine);

  static String _read(String key, String definedValue) {
    if (definedValue.isNotEmpty) return definedValue;
    final fromDotenv = dotenv.maybeGet(key);
    if (fromDotenv != null && fromDotenv.isNotEmpty) return fromDotenv;
    throw StateError(
      'Missing environment value "$key". Provide it with '
      '--dart-define-from-file or in the dotenv asset.',
    );
  }
}
