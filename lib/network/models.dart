
class UserItem {
  String id;
  String name;
  String email;
  String phone;

  String countryCode;
  String token;
  String tokenExpiry;
  UserItem({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.token,
    required this.tokenExpiry,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
        name: json['data']['name'],
        email: json['data']['email'],
        phone: json['data']['phone'],
        id: json['data']['id'],
        countryCode: json['data']['country_code'],
        token: json['data']['token'],
        tokenExpiry: json['data']['token_expiry']);
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'country_code': countryCode,
      'token': token,
      'token_expiry': tokenExpiry,
      'id': id
    };
  }
}


