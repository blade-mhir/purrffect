import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:purrfect/app/AuthSelection.dart';
import 'package:purrfect/app/home.dart';
import 'package:purrfect/app/list_of_vet.dart';
import 'package:purrfect/app/pet-profile.dart';
import 'package:purrfect/app/splash_screen.dart';
import 'package:purrfect/app/user_profile.dart';
import 'package:purrfect/app/appointment.dart';
import 'package:purrfect/app/mypets.dart';
import 'package:purrfect/app/vet-profile.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

final goRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [ //onboarding routes
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/authselection',
      builder: (context, state) => const AuthSelection(),
    ),
    //add here the signin and sign up route

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute( // Home Tab Routes
              path: '/home',
              builder: (context, state) => const Home(),
              routes: [
                GoRoute(
                  path: 'vetprofile',
                  builder: (context, state) => const VetProfile(),
                ),
                GoRoute(
                  path: 'userprofile',
                  builder: (context, state) => const UserProfile(),
                ),
                GoRoute(
                  path: 'listofvet',
                  builder: (context, state) => const ListOfVet(),
                ),
              ],
            ),

          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute( // Appointment Tab Route
              path: '/appointment',
              builder: (context, state) => const Appointments(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            GoRoute( // MyPets Tab Routes
                path: '/mypets',
                builder: (context, state) => const MyPets(),
                routes: [
                  GoRoute(
                    path: 'petprofile',
                    builder: (context, state) => const PetProfile(),
                  )
                ]
            ),
          ],
        ),


      ],
    ),
  ],
);

void main() {
  usePathUrlStrategy();
  runApp(const Purrfect());
}


class Purrfect extends StatelessWidget {
  const Purrfect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,

    );
  }
}




class CustomSvgIcon extends StatelessWidget {
  final String imagePath;
  final Color? color;

  const CustomSvgIcon(this.imagePath, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      color: color,
    );
  }
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
      key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    if (index == navigationShell.currentIndex) {
      if (index == 0) {
        Navigator.of(_shellNavigatorAKey.currentContext!).push(MaterialPageRoute(builder: (_) => const Home()));
      } else if (index == 1) {
        Navigator.of(_shellNavigatorBKey.currentContext!).push(MaterialPageRoute(builder: (_) => const Appointments()));
      } else if (index == 2) {
        Navigator.of(_shellNavigatorCKey.currentContext!).push(MaterialPageRoute(builder: (_) => const MyPets()));
      }
    } else {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }
  }





  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      } else {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
    });
  }
}




class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    Key? key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(
              color: Colors.amber, // Set the text color when selected
            ),
          ),
        ),
        child: PhysicalModel(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          elevation: 4, // Shadow elevation
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onDestinationSelected,

              items: [
                _buildNavigationBarItem(
                  'assets/app/images/home.svg',
                  'Home',
                  selectedIndex == 0,

                ),
                _buildNavigationBarItem(
                  'assets/app/images/appoint.svg',
                  'Appointment',
                  selectedIndex == 1,
                ),
                _buildNavigationBarItem(
                  'assets/app/images/mypets.svg',
                  'My Pets',
                  selectedIndex == 2,
                ),
              ],
              selectedItemColor: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      String iconPath,
      String label,
      bool selected,
      ) {
    return BottomNavigationBarItem(
      icon: CustomSvgIcon(
        iconPath,
        color: selected ? Colors.amber : Colors.grey,
      ),
      label: label,
      activeIcon: CustomSvgIcon(
        iconPath,
        color: Colors.amber,
      ),
    );
  }






}



class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    Key? key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
        child: PhysicalModel(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          elevation: 4, // Shadow elevation
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onDestinationSelected,
              items: [
                _buildNavigationBarItem(
                  'assets/app/images/home.svg',
                  'Home',
                  selectedIndex == 0,

                ),
                _buildNavigationBarItem(
                  'assets/app/images/appoint.svg',
                  'Appointment',
                  selectedIndex == 1,
                ),
                _buildNavigationBarItem(
                  'assets/app/images/mypets.svg',
                  'My Pets',
                  selectedIndex == 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      String iconPath,
      String label,
      bool selected,
      ) {
    return BottomNavigationBarItem(
      icon: CustomSvgIcon(
        iconPath,
        color: selected ? Colors.amber : Colors.grey,
      ),
      label: label,
    );
  }



}
