import '../core/user/models.dart';
import 'models.dart';

extension UserItemExtension on UserItem {
  UserProfile toStore() {
    return UserProfile(
        name: name,
        email: email,
        phone: phone,
        countryCode: countryCode,
        token: token,
        tokenExpiry: tokenExpiry);
  }
}
