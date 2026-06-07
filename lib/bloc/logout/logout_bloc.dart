import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part '../bloc/logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(_Initial());

  @override
  Stream<LogoutState> mapEventToState(
    LogoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
