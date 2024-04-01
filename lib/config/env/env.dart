import 'package:tfc/config/env/env_type.dart';

class Env {
  final EnvType envType;
  final bool debug;
  final bool external;
  final bool devicePreview;
  final String version;
  final String dateFormat;
  final String clientID;
  final String domain;
  final String baseUrl;
  final String playStoreID;
  final String appStoreID;
  final String statementSyncTime;
  final String supportEmail;
  final String website;
  final bool localTimeZone;
  final int connectionTimeout;
  final int receiveTimeout;
  Env({
    required this.envType,
    required this.debug,
    required this.external,
    required this.devicePreview,
    required this.version,
    required this.dateFormat,
    required this.clientID,
    required this.domain,
    required this.baseUrl,
    required this.playStoreID,
    required this.appStoreID,
    required this.statementSyncTime,
    required this.supportEmail,
    required this.website,
    required this.localTimeZone,
    required this.connectionTimeout,
    required this.receiveTimeout,
  });

  factory Env.dev() {
    return Env(
      envType: EnvType.dev,
      debug: true,
      external: false,
      devicePreview: false,
      version: '1.0.0+1',
      dateFormat: 'HH:mm, MMM dd yyyy',
      clientID: '',
      domain: 'https://thinhlh.com',
      baseUrl: 'https://thinhlh.com/api',
      playStoreID: "playStoreID",
      appStoreID: "appStoreID",
      statementSyncTime: "2021-01-01",
      supportEmail: "thinhlh0812@gmail.com",
      website: "www.thinhlh.com",
      localTimeZone: true,
      connectionTimeout: 60000,
      receiveTimeout: 60000,
    );
  }

  factory Env.prod() {
    return Env(
      envType: EnvType.production,
      debug: false,
      external: false,
      devicePreview: false,
      version: '0.0.1',
      dateFormat: 'HH:mm, MMM dd yyyy',
      clientID: '',
      domain: 'https://thinhlh.com',
      baseUrl: 'https://thinhlh.com/api',
      playStoreID: "playStoreID",
      appStoreID: "appStoreID",
      statementSyncTime: "2021-01-01",
      supportEmail: "supportEmail",
      website: "website",
      localTimeZone: true,
      connectionTimeout: 60000,
      receiveTimeout: 60000,
    );
  }

  factory Env.staging() {
    return Env(
      envType: EnvType.staging,
      debug: true,
      external: false,
      devicePreview: false,
      version: '0.0.1',
      dateFormat: 'HH:mm, MMM dd yyyy',
      clientID: '',
      domain: 'https://api.saleboltapp.com',
      baseUrl: 'http://159.223.87.59:8000/api/v1',
      playStoreID: "playStoreID",
      appStoreID: "appStoreID",
      statementSyncTime: "2021-01-01",
      supportEmail: "supportEmail",
      website: "website",
      localTimeZone: true,
      connectionTimeout: 60000,
      receiveTimeout: 60000,
    );
  }
}
