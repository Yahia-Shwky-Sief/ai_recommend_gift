import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCubit extends Cubit<int> {
  OptionCubit() : super(-1); // -1 means nothing selected

  void selectOption(int index) {
    emit(index);
  }
}