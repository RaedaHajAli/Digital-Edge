class UserProfile {
  
  String name;
  String email;
  String phone;

  String countryCode;
  String token;
  String tokenExpiry;
  UserProfile({
  
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.token,
    required this.tokenExpiry,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
     
        countryCode: json['country_code'],
        token: json['token'],
        tokenExpiry: json['token_expiry']);
  }
  Map<String,dynamic> toJson() {
    return {
      'email':email,
      'name':name,
      'phone':phone,
      'country_code':countryCode,
      'token':token,
      'token_expiry':tokenExpiry,
   
    };
  }
}
