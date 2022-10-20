import 'package:hosy/core/const/path_constants.dart';
import 'package:hosy/core/services/user_details.dart';

class UserController {
  static User getUser() {
    return User(
        mobileNumber: '+254112187873',
        name: 'Mobisa Kwamboka',
        photoUrl: PathConstants.profile1);
  }
}
