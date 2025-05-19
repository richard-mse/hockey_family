
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constants.dart';
import '../../../../../l10n/gen/app_localizations.dart';
import '../../../../repositories/game_repository.dart';
import '../../../../repositories/models/game_model.dart';
import '../../match/match_page.dart';
import '../bloc/home_bloc.dart';

part './home_view_initial.dart';
part './home_view_loading.dart';
part './home_view_loaded.dart';
part './home_view_success.dart';
part './home_view_failure.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(repository: GameRepository.instance)..add(HomeInitEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, HomeState state) => Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.title_home_page),
          ),
          body: _getBody(state, context),
        ),
      ),
    );
  }

  Widget _getBody(HomeState state, BuildContext context) {
    if (state is HomeInitialState) {
      return const _HomeViewInitial();
    } else if (state is HomeLoadingState) {
      return const _HomeViewLoading();
    } else if (state is HomeLoadedState) {
      return const _HomeViewLoaded();
    } else if (state is HomeSuccessState) {
      return const _HomeViewSuccess();
    } else if (state is HomeFailureState) {
      return const _HomeViewFailure();
    } else {
      return Container(); // Fallback for unexpected states
    }
  }
}
