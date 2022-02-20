import 'package:dartz/dartz.dart';
import 'package:tfc/app/home/domain/entities/home_entity.dart';
import 'package:tfc/base/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> checkConnection();
}
