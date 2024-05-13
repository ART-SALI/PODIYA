import 'package:pod_i_ya/core/error/failures.dart';
import 'package:pod_i_ya/core/error/repository_request_handler.dart';
import 'package:pod_i_ya/core/helper/type_aliases.dart';
import 'package:pod_i_ya/features/logging/data/datasource/_datasource.dart';
import 'package:pod_i_ya/features/logging/domain/repositories/_repository.dart';

class RepositoryImpl implements Repository {
  final Datasource datasource;

  RepositoryImpl({required this.datasource});

  @override
  FutureFailable<bool> postCreateNewUser(Map<String, dynamic> newUser) {
    return RepositoryRequestHandler<bool>()(
      request: () => datasource.postCreateNewUser(newUser),
      defaultFailure: const Failure(),
    );
  }
}
