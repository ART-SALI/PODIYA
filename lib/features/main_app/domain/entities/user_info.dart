class UserInfo{
  String? userName;
  String? email;
  String? avatar;
  bool? isStaff;
  bool? isSuperuser;
  List<dynamic>? profile;
  DateTime? registrationDate;

  UserInfo({
    this.userName,
    this.email,
    this.avatar,
    this.isStaff,
    this.isSuperuser,
    this.profile,
    this.registrationDate
});
}

class UserProfile{
  String? userAbout;
  List<dynamic>? followers;


  UserProfile({
    this.userAbout,
    this.followers,
  });
}