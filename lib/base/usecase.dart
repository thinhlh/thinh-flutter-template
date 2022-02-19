import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:tfc/base/failure.dart';
import 'package:tfc/base/params.dart';

/// P is the paramater object, T is the return type of usecase
abstract class UseCase<P extends Param, ReturnType> {
  Future<Either<Failure, ReturnType>> call(P param);
}

class TestParam with Param {
  int a = 2;
}

class Test extends UseCase<TestParam, void> {
  @override
  Future<Either<Failure, void>> call(TestParam param) {
    throw UnimplementedError();
  }
}
