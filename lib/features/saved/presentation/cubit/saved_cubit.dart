import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());
}
