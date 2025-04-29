import 'package:flutter/material.dart';
import './routes.dart';
import './scaffold_with_nav_bar_destination.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithNavBar({
    required this.child,
    super.key
  });

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBar();
}

class _ScaffoldWithNavBar extends State<ScaffoldWithNavBar> {
  getTabs(BuildContext context) => [
    const ScaffoldWithNavBarDestination(
        icon: Icon(Icons.home),
        initialLocation: RouteNames.home,
        label: "Home"
    ),
    const ScaffoldWithNavBarDestination(
        icon: Icon(Icons.person),
        initialLocation: RouteNames.account,
        label: "Account"
    ),
    const ScaffoldWithNavBarDestination(
        icon: Icon(Icons.flood),
        initialLocation: RouteNames.test,
        label: "Test"
    ),
    //TODO: Add more tabs here
    const ScaffoldWithNavBarDestination(
        icon: Icon(Icons.live_tv),
        initialLocation: RouteNames.match,
        label: "Today"
    ),

  ];

  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex => _locationToTabIndex(GoRouterState.of(context).matchedLocation);

  int _locationToTabIndex(String location) {
    final index =
    getTabs(context).indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(getTabs(context)[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: getTabs(context),
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => _onItemTapped(context, index)
      ),
      body: widget.child,
    );
  }
}
