import 'package:pod_i_ya/core/helper/type_aliases.dart';
import 'package:pod_i_ya/features/logging//domain/entities/_.dart';

class UserModel extends User {
  UserModel({super.token, super.refresh});

  UserModel.fromJson(Json json) {
    token = json['access'];
    refresh = json['refresh'];
  }

  Json toJson() {
    final Map<String, dynamic> data = {};
    data['access'] = token;
    data['refresh'] = refresh;
    return data;
  }
}
