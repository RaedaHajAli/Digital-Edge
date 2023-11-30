// ignore_for_file: public_member_api_docs, sort_constructors_first
//  register request model
class RegisterRequest {
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String countryCode;
  RegisterRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.countryCode,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'country_code': countryCode,
      'password_confirm': confirmPassword,
    };
  }
}

// Response models
class BaseResponse {
  bool success;

  String message;
  BaseResponse({
    required this.success,
    required this.message,
  });
  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}


