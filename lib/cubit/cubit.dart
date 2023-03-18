import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/cubit/states.dart';

class ResponsiveCubit extends Cubit<ResponsiveState> {
  ResponsiveCubit() : super(InitialState());

  static ResponsiveCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }
}
