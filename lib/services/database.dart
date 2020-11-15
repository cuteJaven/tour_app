import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tour_app/models/userinfo.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection('userInfo');

  Future updateUserData(
    String name,
    String description,
    bool sex,
    String backUrl,
    String avatar,
    int followers,
    int following,
  ) async {
    return await userInfoCollection.doc(uid).set({
      //女性为true，男性为false
      //'sex': sex,
      'name': name,
      'description': description,
      'sex': sex,
      'backUrl': backUrl,
      'avatar': avatar,
      'followers': followers,
      'following': following,
    });
  }

  // userInfo list from snapshot
  List<UserInfo> _userInfoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UserInfo(
        name: doc.data()['name'] ?? '',
        description: doc.data()['description'] ?? '',
        sex: doc.data()['sex'] ?? true,
        backUrl: doc.data()['backUrl'] ?? '',
        avatar: doc.data()['avatar'] ?? '',
        followers: doc.data()['followers'] ?? 0,
        following: doc.data()['following'] ?? 0,
      );
    }).toList();
  }

  // get userInfo stream
  Stream<List<UserInfo>> get userInfo {
    return userInfoCollection.snapshots().map((_userInfoListFromSnapshot));
  }
}
