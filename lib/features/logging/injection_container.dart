import 'package:pod_i_ya/features/logging/presentation/entering_pages/cubit/_cubit.dart';
import 'package:pod_i_ya/injection_container.dart';
import 'package:dio/dio.dart';

import 'data/datasource/_datasource.dart';
import 'data/repositories/_repository_impl.dart';
import 'domain/repositories/_repository.dart';

mixin CreateUserNameInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();
    final Dio dio = sl<Dio>(instanceName: globalDio);

    // cubits
    sl.registerLazySingleton(() => UserCubit(repository: sl()));

    // use cases

    // repositories
    sl.registerLazySingleton<Repository>(
        () => RepositoryImpl(datasource: sl())
    );

    // data sources
    sl.registerLazySingleton<Datasource>(() => DatasourceImpl(dio: dio));
  }
}
