import 'package:hydrated_bloc/hydrated_bloc.dart';

class UserCubit extends HydratedCubit<String>{
  UserCubit() : super("none");

  void toggleToken({required String value}){
    emit(value);
  }

  @override
  String? fromJson(Map<String, dynamic> json) {
    return json["token"];
  }

  @override
  Map<String, dynamic>? toJson(String state) {
    return {"token":state};
  }

}