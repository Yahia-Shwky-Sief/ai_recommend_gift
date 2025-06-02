// lib/cubit/multi_select_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiSelectCubit extends Cubit<List<bool>> {
  MultiSelectCubit(int itemCount) : super(List<bool>.filled(itemCount, false));

  /// Toggle the checkbox at [index].
  void toggleOption(int index) {
    final newState = List<bool>.from(state);
    newState[index] = !newState[index];
    emit(newState);
  }

  /// (Optional) Clear all selections.
  void clearAll() {
    emit(List<bool>.filled(state.length, false));
  }
}
