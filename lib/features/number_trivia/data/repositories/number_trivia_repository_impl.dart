import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app_counter/core/error/failures.dart';
import 'package:flutter_app_counter/core/platform/network_info.dart';
import 'package:flutter_app_counter/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_app_counter/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_app_counter/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:flutter_app_counter/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
      int number) {
    networkInfo.isConnected;
    return null;
  }

  @override
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia() {
    return null;
  }
}
