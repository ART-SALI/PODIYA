import 'package:pod_i_ya/core/error/failures.dart';
import 'package:dartz/dartz.dart';

typedef Json = Map<String, dynamic>;
typedef FutureFailable<T> = Future<Either<Failure, T>>;
typedef Failable<T> = Either<Failure, T>;
