final String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
final String key = "P";

String autokeyEncrypt(String plainText) {
  plainText = plainText.toUpperCase();
  int len = plainText.length;

  String subkey = key + plainText;
  subkey = subkey.substring(0, subkey.length - key.length);

  String sb = "";
  for (int x = 0; x < len; x++) {
    int get1 = alpha.indexOf(plainText[x]);
    int get2 = alpha.indexOf(subkey[x]);

    int total = (get1 + get2) % 26;

    sb += alpha[total];
  }

  return sb;
}

String autokeyDecrypt(String cipherText) {
  cipherText = cipherText.toUpperCase();
  int len = cipherText.length;

  String current = key;
  String sb = "";

  for (int x = 0; x < len; x++) {
    int get1 = alpha.indexOf(cipherText[x]);
    int get2 = alpha.indexOf(current[x]);

    int total = (get1 - get2) % 26;
    total = (total<0) ? total + 26 : total;
    sb += alpha[total];

    current += alpha[total];
  }

  return sb;
}

String columnarEncrypt(String plainText) {
  return plainText;
}

String columnarDecrypt(String cipherText) {
  return cipherText;
}