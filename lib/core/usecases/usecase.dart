import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_counter/core/error/failures.dart';


// Esta interface foi criada para obrigar a todos casos de uso a implementarem
// um método call.

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// Esta classe foi criada para quando for utilizar o caso de uso
// getRandomNumberTrivia.
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
