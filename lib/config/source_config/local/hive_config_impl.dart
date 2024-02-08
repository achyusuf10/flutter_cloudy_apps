import 'dart:convert';

import 'package:cloudy/config/source_config/local/hive_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfigImpl extends HiveConfig {
  final Box<dynamic> _encryptedBox;

  HiveConfigImpl._(this._encryptedBox);

  static Future<HiveConfigImpl> instance() async {
    await Hive.initFlutter();
    const secureKey = 'cloudyKey';
    const secureStorage = FlutterSecureStorage();
    // if key not exists return null
    final encryptionKeyString = await secureStorage.read(key: secureKey);
    if (encryptionKeyString == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: secureKey,
        value: base64UrlEncode(key),
      );
    }

    final key = await secureStorage.read(key: secureKey);
    final encryptionKeyUint8List = base64Url.decode(key!);

    final box = await Hive.openBox(
      'app',
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );
    return HiveConfigImpl._(box);
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _encryptedBox.delete(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    try {
      await _encryptedBox.deleteAll(keys);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> get<T>({required String key}) async {
    try {
      return await _encryptedBox.get(key) as T?;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> reset() async {
    try {
      await _encryptedBox.clear();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> set<T>({required String key, required T data}) async {
    try {
      await _encryptedBox.put(key, data);
    } catch (e) {
      rethrow;
    }
  }
}
