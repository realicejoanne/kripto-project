import 'package:random_string/random_string.dart' as random;

final String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
final String key = "PP";
final String keyColumnar = "PP";

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
  List<int> arrange = arrangeKey(keyColumnar);

  int lenkey = arrange.length;
  int lentext = plainText.length;

  double temp = lentext / lenkey;
  int row = temp.ceil();

  var grid = new List.generate(row, (_) => new List(lenkey));
  
  int z = 0;
  for (int x = 0; x < row; x++) {
      for (int y = 0; y < lenkey; y++) {
          if (lentext == z) {
              // at random alpha for trailing null grid
              grid[x][y] = RandomAlpha();
              z--;
          } else {
              grid[x][y] = plainText[z];
          }

          z++;
      }
  }
  String enc = "";
  for (int x = 0; x < lenkey; x++) {
      for (int y = 0; y < lenkey; y++) {
          if (x == arrange[y]) {
              for (int a = 0; a < row; a++) {
                  enc = enc + grid[a][y];
              }
          }
      }
  }
  return enc;
}

String columnarDecrypt(String cipherText) {
  List<int> arrange = arrangeKey(keyColumnar);
  int lenkey = arrange.length;
  int lentext = cipherText.length;

  // int row = (int) Math.ceil((double) lentext / lenkey);
  double temp = lentext / lenkey;
  int row = temp.ceil();  

  String regex = "(?<=\\G.{" + row.toString() + "})";
  List<String> get = cipherText.split(regex);

  // char[][] grid = new char[row][lenkey];
  var grid = new List.generate(row, (_) => new List(lenkey));

  for (int x = 0; x < lenkey; x++) {
      for (int y = 0; y < lenkey; y++) {
          if (arrange[x] == y) {
              for (int z = 0; z < row; z++) {
                  grid[z][y] = get[arrange[y]][z];
              }
          }
      }
  }

  String dec = "";
  for (int x = 0; x < row; x++) {
      for (int y = 0; y < lenkey; y++) {
          dec = dec + grid[x][y];
      }
  }

  return dec;
}

List<int> arrangeKey(String keyColumnar) {
  //arrange position of grid
  List<String> keys = keyColumnar.split("");
  keys.sort();
  List<int> num = new List(keys.length);
  for (int x = 0; x < keys.length; x++) {
      for (int y = 0; y < keyColumnar.length; y++) {
          if (keys[x] == (keyColumnar[y] + "")) {
              num[y] = x;
              break;
          }
      }
  }

  return num;
}

String RandomAlpha() {
  //generate random alpha for null space
  String r = random.randomAlpha(1);
  return r;
}