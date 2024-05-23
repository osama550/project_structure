import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  // A function that is called whenever the state of the bloc changes. It logs the string representation of the change if the bloc is of type Cubit.
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) log(change.toString());
  }

  @override
  // A function that is called whenever a new transition occurs in the bloc.
  // It logs the details of the transition using the provided bloc and transition parameters.
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(transition.toString());
  }
}
