import 'package:clean_code_test/config/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
