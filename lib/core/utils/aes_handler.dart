import 'dart:core';
import 'dart:math';
import 'package:encrypt/encrypt.dart';

class AESENCRYPTION {

  String aesEncryption({
    required String plainText,
  }) {

    Key keyBytes = Key.fromUtf8("CDay@#23@\$@MinisterItems\$");
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(keyBytes, mode: AESMode.ecb));

    final encryptValue = encrypter.encrypt(plainText, iv: iv);

    return encryptValue.base64;
  }

  String getSalt() {
    String _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz";
    String sb = "";
    var rng = Random();
    return String.fromCharCodes(Iterable.generate(
        _chars.length,
            (_) => _chars.codeUnitAt(rng.nextInt(
          _chars.length,
        ))));
  }


  aesDecryption(String plainText) {
    String value = plainText.replaceAll(" ", "+");
    Key keyBytes = Key.fromUtf8("CDay@#23@\$@MinisterItems\$");
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(keyBytes, mode: AESMode.ecb));

    final decryptValue = encrypter.decrypt64(value, iv: iv);

    return decryptValue.toString();



  }

}