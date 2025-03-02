part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String loadingText;
  final List<Social> socials;
  final bool loggedOut;

  const HomeState({
    required this.isLoading,
    required this.loadingText,
    required this.socials,
    required this.loggedOut,
  });

  HomeState.initial()
      : isLoading = false,
        loadingText = '',
        socials = [],
        loggedOut = false;

  @override
  List<Object> get props => [
        isLoading,
        socials,
        loadingText,
        loggedOut,
      ];

  HomeState copyWith({
    bool? isLoading,
    String? loadingText,
    List<Social>? socials,
    bool? loggedOut,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      loadingText: loadingText ?? this.loadingText,
      socials: socials ?? this.socials,
      loggedOut: loggedOut ?? this.loggedOut,
    );
  }
}
