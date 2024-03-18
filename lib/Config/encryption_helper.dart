import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';

class EncryptionHandler {
  static const String SECRET_KEY = "OcbjDea7a9qENwpkKsh8jJ5DMqJgpned32q1yDnC6PczcLfufwKiCpUcHxxd/Ynf";
  static const String SALT_VALUE = "abcdefg";

  static String? encrypt(String plainText) {
    try {
      final keyBytes = Uint8List.fromList(utf8.encode(SECRET_KEY));
      final saltBytes = Uint8List.fromList(utf8.encode(SALT_VALUE));
      final key = KeyParameter(keyBytes);
      final params = Pbkdf2Parameters(saltBytes, 65536, 256);
      final keyGen = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64));
      keyGen.init(params);
      final derivedKey = keyGen.process(keyBytes);

      final cbcCipher = CBCBlockCipher(AESFastEngine());
      final cbcParameters = ParametersWithIV(key, Uint8List(16));
      cbcCipher.init(true, cbcParameters);

      final paddedPlainText = padString(plainText);
      final textBytes = Uint8List.fromList(utf8.encode(paddedPlainText));
      final cipherBytes = cbcCipher.process(textBytes);

      return base64.encode(cipherBytes);
    } catch (e) {
      print('Error occurred during encryption: $e');
      return null;
    }
  }

  static dynamic decrypt(String cipherText) {
    try {
      final keyBytes = Uint8List.fromList(utf8.encode(SECRET_KEY));
      final saltBytes = Uint8List.fromList(utf8.encode(SALT_VALUE));
      final key = KeyParameter(keyBytes);
      final params = Pbkdf2Parameters(saltBytes, 65536, 256);
      final keyGen = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64));
      keyGen.init(params);
      final derivedKey = keyGen.process(keyBytes);

      final cbcCipher = CBCBlockCipher(AESFastEngine());
      final cbcParameters = ParametersWithIV(key, Uint8List(16));
      cbcCipher.init(false, cbcParameters);

      final cipherBytes = base64.decode(cipherText);
      final plainBytes = cbcCipher.process(cipherBytes);

      return utf8.decode(removePadBytes(plainBytes));
    } catch (e) {
      print('Error occurred during decryption: $e');
      return null;
    }
  }

  static String padString(String input) {
    var padLength = 16 - (input.length % 16);
    padLength ??= 16;
    return input.padRight(input.length + padLength, String.fromCharCode(padLength));
  }

  static Uint8List removePadBytes(Uint8List input) {
    var padLength = input.last;
    return Uint8List.fromList(input.sublist(0, input.length - padLength));
  }
}


