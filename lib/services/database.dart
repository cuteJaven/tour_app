import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tour_app/models/user.dart';
import 'package:tour_app/models/userinfo.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection('userInfo');

  Future updateUserData({
    String name,
    String description,
    bool sex,
    String backUrl,
    String avatar,
    int followers,
    int following,}
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

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid ?? '',
      name: snapshot.data()['name'] ?? '',
      description: snapshot.data()['description'] ?? '',
      sex: snapshot.data()['sex'] ?? true,
      backUrl: snapshot.data()['backUrl'] ?? '',
      avatar: snapshot.data()['avatar'] ?? '',
      followers: snapshot.data()['followers'] ?? 0,
      following: snapshot.data()['following'] ?? 0,
    );
  }

  // get userInfo stream
  Stream<List<UserInfo>> get userInfoStream {
    return userInfoCollection.snapshots().map(_userInfoListFromSnapshot);
    //这里简写了，参考auth.dart
  }

  //get user doc stream
  Stream<UserData> get userDataStream {
    return userInfoCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
    //这里简写了，参考auth.dart
  }
}
