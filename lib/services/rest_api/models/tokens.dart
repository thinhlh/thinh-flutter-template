import 'dart:convert';

class Tokens {
  final String accessToken;
  final String refreshToken;
  Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokens.fromMap(Map<String, dynamic> map) {
    return Tokens(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }

  factory Tokens.fromJson(String source) => Tokens.fromMap(json.decode(source));

  @override
  String toString() =>
      'Tokens(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tokens &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
