

import '../../modules/auth/view/auth_options_view.dart';
import '../../modules/main/views/main_view.dart';

enum UserStatus {
  signedIn,
  signedOut,
}

String getScreen (UserStatus status) {
  switch (status) {
    case UserStatus.signedIn:
      return MainView.route;
   
    case UserStatus.signedOut:
      return AuthOptionView.route;

    default:
      return AuthOptionView.route;
  }
}
