import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam/models/singleton/user_details_singleton.dart';
import 'package:flutter_exam/models/social_model.dart';
import 'package:flutter_exam/utilities/shared_preference/shared_preference_manager.dart';
import 'package:flutter_exam/utilities/social_services.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    // on<HomeEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<LoadHome>(_loadHome);
    on<Logout>(_logout);
  }

  Future _loadHome(LoadHome event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, loadingText: "Fetching Data"));

    var socials = await SocialServices().getSocials();

    emit(state.copyWith(
      isLoading: false,
      socials: socials,
    ));
  }

  Future _logout(Logout event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, loadingText: "Logging Out"));

    CurrentUser().clearUser();
    SharedPreferencesManager().removeCredentials();

    await Future.delayed(Duration(seconds: 3));

    emit(state.copyWith(loggedOut: true));
  }
}
