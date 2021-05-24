import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fix_me_app/Config/Config.dart';
import 'package:fix_me_app/Widgets/Models/AllUsers.dart';

class AssistantMethods {
  void obtainPlaceDirectionDetails() {}

  static void getCurrentOnlineUserInfo() async {
    firebaseUser = await FirebaseAuth.instance.currentUser();
    String userId = firebaseUser.uid;
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("drivers").child(userId);
    reference.once().then((DataSnapshot dataSnapShot) {
      if (dataSnapShot.value != null) {
        userCurrentInfo = Users.fromSnapshot(dataSnapShot);
      }
    });
  }
}
