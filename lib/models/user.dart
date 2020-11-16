class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String description;
  final bool sex;
  final String backUrl;
  final String avatar;
  final int followers;
  final int following;

  UserData(
      {this.uid,
      this.name,
      this.description,
      this.sex,
      this.backUrl,
      this.avatar,
      this.followers,
      this.following});
}
