import 'package:pod_i_ya/core/helper/type_aliases.dart';

abstract class Repository {
  FutureFailable<bool> postCreateNewUser(Map<String, dynamic> newUser);
}
