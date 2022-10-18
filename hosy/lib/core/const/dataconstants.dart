import 'package:hosy/core/const/path_constants.dart';
import 'package:hosy/core/const/text_constants.dart';
import 'package:hosy/screens/onboarding/widget/onbardingtile.dart';

class DataConstants {
  static final onboardingTiles = [
    const OnboardingTile(
      title: TextConstants.needAmbulance,
      imagePath: PathConstants.ambulance,
      mainText: TextConstants.onboardingTile1,
    ),
    const OnboardingTile(
      title: TextConstants.needDoctor,
      imagePath: PathConstants.doctor,
      mainText: TextConstants.onboardingTile2,
    ),
    const OnboardingTile(
      title: TextConstants.haveAnEmergency,
      imagePath: PathConstants.emergency,
      mainText: TextConstants.onboardingTile3,
    ),
  ];
}
