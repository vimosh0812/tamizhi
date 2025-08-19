import 'package:go_router/go_router.dart';
import 'views/app.dart';
import 'views/home/screens/metaphor_classifier.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => App(),
    ),
    GoRoute(
      path: '/metaphor-classifier',
      builder: (context, state) => const MetaphorClassifierScreen(),
    ),
  ],
);
