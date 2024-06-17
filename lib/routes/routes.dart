import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quicknotes/screens/AddNotes/add_notes.dart';
import 'package:quicknotes/screens/HomeScreen/HomeScreen.dart';
import 'package:quicknotes/screens/Widgets/NoInternet.dart';
import 'package:quicknotes/screens/profile/profile.dart';
import 'package:quicknotes/screens/settings/setting.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';

import '../screens/EditNotes/edit_notes.dart';
import '../screens/Widgets/loading.dart';

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
  initialLocation: '/home',
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
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreenPage(),
              ),
              routes: [],
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
          navigatorKey: _shellNavigatorAddKey,
          routes: [
            GoRoute(
              path: '/add',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AddNotes(),
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        type: BottomNavigationBarType.shifting,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _goBranch,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group_rounded,
              size: 30,
            ),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: 'Settings',
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: InternetWidget(
        lookupUrl: 'https://apiv1.toystack.dev',
        loadingWidget: const LoadingScreen(),
        offline: const NoInternet(),
        online: widget.navigationShell,
      ),
    );
  }
}
