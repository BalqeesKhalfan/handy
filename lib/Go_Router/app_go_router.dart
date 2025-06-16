import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homecleaning/Components/bottom_navigation_bar.dart';
import 'package:homecleaning/Screens/Auth/create_account.dart';
import 'package:homecleaning/Screens/Auth/sign_in.dart';
import 'package:homecleaning/Screens/BookmarkFolder/bookmark.dart';
import 'package:homecleaning/Screens/ChatFolder/chat.dart';
import 'package:homecleaning/Screens/ExploreFolder/explore.dart';
import 'package:homecleaning/Screens/HomeFolder/home.dart';
import 'package:homecleaning/Screens/Launch/on_boarding.dart';
import 'package:homecleaning/Screens/Launch/splash.dart';
import 'package:homecleaning/Screens/ProfileFolder/profile.dart';

class AppGoRouter {
  AppGoRouter._();
  static String initial = '/HomeFolder';

  static final _rootNavigationKey = GlobalKey<NavigatorState>();

  static final _shellNavigatorHome = GlobalKey<NavigatorState>(
    debugLabel: 'shellHome',
  );
  static final _shellNavigatorExplore = GlobalKey<NavigatorState>(
    debugLabel: 'shellExplore',
  );
  static final _shellNavigatorBookmark = GlobalKey<NavigatorState>(
    debugLabel: 'shellBookmark',
  );
  static final _shellNavigatorChat = GlobalKey<NavigatorState>(
    debugLabel: 'shellChat',
  );
  static final _shellNavigatorProfile = GlobalKey<NavigatorState>(
    debugLabel: 'shellProfile',
  );

  static final GoRouter router = GoRouter(
    initialLocation: initial,
    navigatorKey: _rootNavigationKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        name: 'Splash',
        builder: (context, state) => const Splash(),
      ),
       GoRoute(
        path: '/welcome',
        name: 'Welcome',
        builder: (context, state) => const Splash(),
      ),
       GoRoute(
        path: '/onboarding',
        name: 'Onboarding',
        builder: (context, state) => const Onboarding(),
      ),
       GoRoute(
        path: '/signIn',
        name: 'SignIn',
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: '/createAccount',
        name: 'CreateAccount',
        builder: (context, state) => const CreateAccount(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return FancyBottomBar(navigationShell: navigationShell);
        },

        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: '/HomeFolder',
                name: 'Home',
                builder: (context, state) => const Home(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExplore,
            routes: <RouteBase>[
              GoRoute(
                path: '/ExploreFolder',
                name: 'Explore',
                builder: (context, state) => const Explore(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBookmark,
            routes: <RouteBase>[
              GoRoute(
                path: '/BookmarkFolder',
                name: 'Bookmark',
                builder: (context, state) => const BookMark(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorChat,
            routes: <RouteBase>[
              GoRoute(
                path: '/ChatFolder',
                name: 'Chat',
                builder: (context, state) => const Chat(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfile,
            routes: <RouteBase>[
              GoRoute(
                path: '/ProfileFolder',
                name: 'Profile',
                builder: (context, state) => const Profile(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
