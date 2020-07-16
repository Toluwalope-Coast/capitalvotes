import 'package:http/http.dart' as http;
import 'dart:convert';

Future<BankListInfo> getListOfBanks() async {
  print('Sent get request');
  String publicKey = 'FLWPUBK_TEST-de1eec6cf26e4cafd191c0a8b2308a6b-X';
  String country = 'NG';
  http.Response response = await http.get(
    'https://api.ravepay.co/v2/banks/$country?public_key=$publicKey',
    headers: <String, String>{'Content-Type': 'application/json'},
  );
  if (response.statusCode != 200) {
    print('Something went wrong');
    print(response.statusCode);
    print(response.body);
  }
  return bankListInfoFromJson(response.body);
}

// CONVERTING JSON TO DART MODELS
BankListInfo bankListInfoFromJson(String str) {
  final jsonData = json.decode(str);
  return BankListInfo.fromJson(jsonData);
}

class BankListInfo {
  BankListInfo({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory BankListInfo.fromJson(Map<String, dynamic> json) => BankListInfo(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.banks,
    this.token,
    this.status,
    this.message,
    this.data,
    this.allTransactions,
  });

  List<Bank> banks;
  Token token;
  String status;
  String message;
  dynamic data;
  dynamic allTransactions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banks: List<Bank>.from(json["Banks"].map((x) => Bank.fromJson(x))),
        token: Token.fromJson(json["Token"]),
        status: json["Status"],
        message: json["Message"],
        data: json["Data"],
        allTransactions: json["AllTransactions"],
      );

  Map<String, dynamic> toJson() => {
        "Banks": List<dynamic>.from(banks.map((x) => x.toJson())),
        "Token": token.toJson(),
        "Status": status,
        "Message": message,
        "Data": data,
        "AllTransactions": allTransactions,
      };
}

class Bank {
  Bank({
    this.id,
    this.code,
    this.name,
    this.isMobileVerified,
    this.branches,
  });

  int id;
  String code;
  String name;
  dynamic isMobileVerified;
  dynamic branches;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
        isMobileVerified: json["IsMobileVerified"],
        branches: json["branches"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Code": code,
        "Name": name,
        "IsMobileVerified": isMobileVerified,
        "branches": branches,
      };
}

class Token {
  Token({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
  });

  dynamic accessToken;
  dynamic refreshToken;
  dynamic tokenType;
  int expiresIn;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
