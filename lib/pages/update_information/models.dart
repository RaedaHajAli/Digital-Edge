class UpdateUserRequest {
  String name;
  String email;
  String phone;

  String countryCode;
  UpdateUserRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
    };
  }
}

// update response
class UpdateUserResponse {
  String name;
  String email;
  String phone;
  String countryCode;
  
  UpdateUserResponse({
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
  });
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
        name: json['data']['name'],
        email: json['data']['email'],
        phone: json['data']['phone'],
        countryCode: json['data']['country_code']);
  }
}
