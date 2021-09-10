
import 'dart:typed_data';
import 'dart:convert' show utf8;

// ignore: import_of_legacy_library_into_null_safe
import 'package:aes_crypt/aes_crypt.dart';

class CryptoUtil {
  CryptoUtil._(){

  }

  static CryptoUtil _instance = CryptoUtil._();
  factory CryptoUtil() {
    return _instance;
  }

  AesCrypt getCrypt(String keyStr,String ivStr){
    var crypt = AesCrypt();
    Uint8List key = Uint8List.fromList(utf8.encode(keyStr));
    Uint8List iv = Uint8List.fromList(utf8.encode(ivStr));
    AesMode mode = AesMode.ecb; // Ok. I know it's meaningless here.
    crypt.aesSetKeys(key, iv);
    crypt.aesSetMode(mode);
    return crypt;
  }

  //:TODO 復号化
  String decrypt(String encword,String keyStr,String ivStr) {
    var crypt = getCrypt(keyStr, ivStr);
    Uint8List encwordData = Uint8List.fromList(encword.codeUnits);
    Uint8List decryptedData = crypt.aesDecrypt(encwordData);
    return String.fromCharCodes(decryptedData);
  }

  //:TODO 暗号化
  String encrypt(String encword,String keyStr,String ivStr) {
    var crypt = getCrypt(keyStr, ivStr);
    Uint8List encwordData = Uint8List.fromList(encword.codeUnits);
    Uint8List encryptedData = crypt.aesEncrypt(encwordData);
    return String.fromCharCodes(encryptedData);
  }
}
