import 'package:go_router/go_router.dart';
import '../../presentation/views/details/detail_screen.dart';

import '../../presentation/views/home/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      path: '/details/:characterId',
      builder: (context, state) {
        return DetailScreen(
          characterId: state.pathParameters['characterId'] ?? '-1',
        );
      },
    )
  ],
);
