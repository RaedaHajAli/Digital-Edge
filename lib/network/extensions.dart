import 'package:digitaledge/pages/update_information/models.dart';

import '../core/user/controller.dart';
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
    );
  }
}

extension UpdateResponseExtension on UpdateUserResponse {
  updateStore() {
    UserStore.to.userProfile!.email = email;
    UserStore.to.userProfile!.name = name;
    UserStore.to.userProfile!.phone = phone;
    UserStore.to.userProfile!.countryCode = countryCode;
  }
}
