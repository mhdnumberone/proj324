// lib/core/security/secure_storage_service.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String agentCodeKey = 'current_agent_code_conduit'; // استخدام مفتاح فريد

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  Future<void> writeAgentCode(String agentCode) async {
    await _storage.write(key: agentCodeKey, value: agentCode);
  }

  Future<String?> readAgentCode() async {
    return await _storage.read(key: agentCodeKey);
  }

  Future<void> deleteAgentCode() async {
    await _storage.delete(key: agentCodeKey);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll(); // استخدم بحذر
  }
}

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final storage = ref.watch(flutterSecureStorageProvider);
  return SecureStorageService(storage);
});
