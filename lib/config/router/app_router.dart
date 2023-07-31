
import 'package:go_router/go_router.dart';
import 'package:task_app/config/index.dart';
import 'package:task_app/presentation/screens/index.dart';
import 'package:task_app/presentation/screens/new_task_screen.dart/new_task_screen.dart';


final appRouter = GoRouter(
  redirectLimit: 3,
 
  debugLogDiagnostics: true,
  initialLocation: AppRoutesStrings.initialRoute,
  routes: [
    GoRoute(
      path: AppRoutesStrings.initialRoute,
      name: AppRoutesStrings.initialRoute,
      builder: (context, GoRouterState  state) => const HomeScreen(),
    ),
    GoRoute(
      name: AppRoutesStrings.homeScreenRoute,
      path: AppRoutesStrings.homeScreenRoute,
      builder: (context,GoRouterState  state) => const HomeScreen(),
    ),
    GoRoute(
      name: AppRoutesStrings.newTaskScreenRoute,
      path: AppRoutesStrings.newTaskScreenRoute,
      builder: (context,GoRouterState  state) {

        return  const NewTaskScreen();
      },
      
    ),


//     // transiciones
// GoRoute(
  
//   path: 'details',
//   pageBuilder: (context, state) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: DetailsScreen(name: "prueba",),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity:
//               CurveTween(curve: Curves.easeInOutCirc).animate(animation),
//           child: child,
//         );
//       },
//     );
//   },
// ),

  ],
  errorBuilder: (context, state) {
    return const HomeScreen();
  },
);