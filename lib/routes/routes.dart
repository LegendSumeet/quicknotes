import 'package:QuickNotes/screens/liveRoutes/share.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/HomeScreen/HomeScreen.dart';
import '../screens/profile/profile.dart';
import '../screens/settings/setting.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorshareKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorAddKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellE');

final StartGoRoutes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const HomeScreenPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
              routes: [
                // GoRoute(
                //   path: 'details',
                //   builder: (context, state) =>
                //   const EditNotes(NoteId: NoteId)
                // ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorshareKey,
          routes: [
            GoRoute(
              path: '/share',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ShareNotes(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Profile(),
              ),
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Setting(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNestedNavigation extends ConsumerStatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends ConsumerState<ScaffoldWithNestedNavigation> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavigationBar(
      //   animationDuration: const Duration(milliseconds: 300),
      //   selectedIndex: widget.navigationShell.currentIndex,
      //   onDestinationSelected: _goBranch,
      //   destinations: const [
      //     NavigationDestination(
      //       icon: Icon(Icons.home_outlined),
      //       selectedIcon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.group_outlined),
      //       selectedIcon: Icon(Icons.group),
      //       label: 'Share',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.person_outline),
      //       selectedIcon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.settings_outlined),
      //       selectedIcon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: widget.navigationShell),
    );
  }
}
