abstract class HiveConfig {
  Future<void> set<T>({required String key, required T data});

  Future<T?> get<T>({required String key});

  Future<void> delete(String key);

  Future<void> deleteAll(List<String> keys);

  Future<void> reset();
}
