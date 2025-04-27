import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {
  final String message;

  NetworkFailure({this.message = 'Network Failure'});

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({this.message = 'Cache Failure'});

  @override
  List<Object?> get props => [message];
}
