part of 'saved_cubit.dart';

abstract class SavedState extends Equatable {
  const SavedState();

  @override
  List<Object> get props => [];
}

class SavedInitial extends SavedState {}
