import 'dart:convert';
import 'package:crypto/crypto.dart';

class EncriptarUtil{

   static  String _keySecurity="-CPFN-8aef9d9879896d-underpro-646654ddb-PAGME-76313ef65-freddy";


  static String generateMd5(String input) {

    return md5.convert(utf8.encode(input)).toString();
  }

  static String generateSha512(String input) {
    input=_keySecurity+input+_keySecurity;
    String srt512= sha512.convert(utf8.encode(input)).toString();
    
    return srt512;
  }



  static String generateSha1(String input) {
    return sha1.convert(utf8.encode(input)).toString();
  }
}