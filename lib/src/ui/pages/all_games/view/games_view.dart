
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../constants.dart';
import '../../../../repositories/game_repository.dart';
import '../../../../repositories/models/game_model.dart';
import '../../match/match_page.dart';
import '../bloc/games_bloc.dart';

part './games_view_initial.dart';
part './games_view_loading.dart';
part './games_view_loaded.dart';
part './games_view_success.dart';
part './games_view_failure.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesBloc(repository: GameRepository.instance)..add(GamesInitEvent()),
      child: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, GamesState state) => Scaffold(
          appBar: AppBar(
            title: const Text('Games Page'),
          ),
          body: _getBody(state, context),
        ),
      ),
    );
  }

  Widget _getBody(GamesState state, BuildContext context) {
    if (state is GamesInitialState) {
      return const _GamesViewInitial();
    } else if (state is GamesLoadingState) {
      return const _GamesViewLoading();
    } else if (state is GamesLoadedState) {
      return const _GamesViewLoaded();
    } else if (state is GamesSuccessState) {
      return const _GamesViewSuccess();
    } else if (state is GamesFailureState) {
      return const _GamesViewFailure();
    } else {
      return Container(); // Fallback for unexpected states
    }
  }
}
