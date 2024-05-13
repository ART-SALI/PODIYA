import 'package:bloc/bloc.dart';
import 'package:pod_i_ya/features/logging/domain/repositories/_repository.dart';
import 'package:meta/meta.dart';

part '_state.dart';

class UserCubit extends Cubit<SampleState> {
  UserCubit({required this.repository}) : super(SampleInitial());

  final Repository repository;
}
