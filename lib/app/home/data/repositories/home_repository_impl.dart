import 'package:dartz/dartz.dart';
import 'package:tfc/app/home/data/datasources/home_remote_data_source.dart';
import 'package:tfc/app/home/data/models/home_connection_model.dart';
import 'package:tfc/app/home/domain/entities/home_entity.dart';
import 'package:tfc/app/home/domain/repositories/home_repository.dart';
import 'package:tfc/base/failure.dart';
import 'package:tfc/core/errors/failures.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, HomeEntity>> checkConnection() async {
    try {
      final result = await _remoteDataSource.checkConnection();
      return Right(result);
    } on Exception {
      return Left(APIFailure());
    }
  }
}
