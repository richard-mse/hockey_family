import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/match_bloc.dart';

part 'match_view_initial.dart';
part 'match_view_loading.dart';
part 'match_view_loaded.dart';
part 'match_view_success.dart';
part 'match_view_failure.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchBloc()..add(MatchInitEvent()),
      child: BlocBuilder<MatchBloc, MatchState>(
        builder: (context, MatchState state) => Scaffold(
          appBar: AppBar(
            title: const Text('Match Page'),
          ),
          body: _getBody(state, context),
        ),
      ),
    );
  }

  Widget _getBody(MatchState state, BuildContext context) {
    if (state is MatchInitialState) {
      return const _MatchViewInitial();
    } else if (state is MatchLoadingState) {
      return const _MatchViewLoading();
    } else if (state is MatchLoadedState) {
      return const _MatchViewLoaded();
    } else if (state is MatchSuccessState) {
      return const _MatchViewSuccess();
    } else if (state is MatchFailureState) {
      return const _MatchViewFailure();
    } else {
      return Container(); // Fallback for unexpected states
    }
  }
}
