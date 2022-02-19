enum EnvType { dev, prod }

class Env {
  final EnvType envType;
  final String baseUrl;
  final Duration timeout;

  // Define more environment variables here

  Env._internal({
    required this.envType,
    required this.baseUrl,
    this.timeout = const Duration(seconds: 60),
  });

  factory Env.dev() {
    return Env._internal(
      envType: EnvType.dev,
      baseUrl: 'devUrl',
    );
  }

  factory Env.prod() {
    return Env._internal(
      envType: EnvType.dev,
      baseUrl: 'prodUrl',
    );
  }
}
