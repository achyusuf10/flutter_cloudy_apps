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
    await _encryptedBox.delete(key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    await _encryptedBox.deleteAll(keys);
  }

  @override
  Future<T?> get<T>({required String key}) async {
    return await _encryptedBox.get(key) as T?;
  }

  @override
  Future<void> reset() async {
    await _encryptedBox.clear();
  }

  @override
  Future<void> set<T>({required String key, required T data}) async {
    await _encryptedBox.put(key, data);
  }
}
