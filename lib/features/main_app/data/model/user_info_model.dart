import 'package:pod_i_ya/core/helper/type_aliases.dart';
import 'package:pod_i_ya/features/main_app/domain/entities/user_info.dart';

class UserInfoModel extends UserInfo{
  UserInfoModel(
  {super.userName,
  super.email,
  super.avatar,
  super.isStaff,
  super.isSuperuser,
  super.profile,
  super.registrationDate});

  UserInfoModel.fromJson(Json json){
    userName = json["username"];
    email = json["email"];
    avatar = json["avatar"];
    isStaff = json["is_staff"] as bool;
    isSuperuser = json["is_superuser"] as bool;
    profile = json["profile"] as List?;
    registrationDate = DateTime.parse(json["registration_date"].toString());
  }

}

class UserProfileModel extends UserProfile{
  UserProfileModel({
    super.userAbout,
    super.followers,
});

  UserProfileModel.fromJson(Json json){
    userAbout = json["about"];
    followers = json["followers"] as List?;
  }


}