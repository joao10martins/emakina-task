import 'package:emakina_task/app/resources/strings.dart';
import 'package:emakina_task/features/privacy_policy/pages/privacy_policy_page.dart';
import 'package:emakina_task/features/projects/pages/projects_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:emakina_task/app/router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<_NavigationBarItem> _bottomNavigationBarItems = [
    _NavigationBarItem(
      index: HomePageItem.projectsPage.index,
      page: ProjectsPage(),
    ),
    _NavigationBarItem(
      index: HomePageItem.privacyPolicyPage.index,
      page: PrivacyPolicyPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavigationBarItems[_selectedIndex].page,
      // I just made a very simple Nav Bar for this app,
      // but you could make a Navigation Bloc/Cubit to Handle it and avoid using setState.
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              blurRadius: 40,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            _buildNavigationBarItem(
              SvgPicture.asset(
                'assets/bottomNavBar/tab-icon-projects.svg',
                width: 24,
                height: 24,
              ),
              SvgPicture.asset(
                'assets/bottomNavBar/tab-icon-projects.svg',
                color: Colors.green,
                width: 24,
                height: 24,
              ),
              Strings.projectsPageTitle,
            ),
            _buildNavigationBarItem(
              SvgPicture.asset(
                'assets/bottomNavBar/tab-icon-privacy.svg',
                width: 24,
                height: 24,
              ),
              SvgPicture.asset(
                'assets/bottomNavBar/tab-icon-privacy.svg',
                color: Colors.green,
                width: 24,
                height: 24,
              ),
              Strings.privacyPolicyNavBarTitle,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavigationBarItem(Widget icon, Widget activeIcon, String buttonLabel) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: icon,
      activeIcon: activeIcon,
      label: buttonLabel,
    );
  }
}

@immutable
class _NavigationBarItem extends Equatable {
  const _NavigationBarItem({
    required this.index,
    required this.page,
  });

  final int index;
  final Widget page;

  @override
  List<Object> get props => [
    index,
    page,
  ];
}

enum HomePageItem {
  projectsPage,
  privacyPolicyPage,
}

extension HomePageItemIndex on HomePageItem {
  int get index {
    switch (this) {
      case HomePageItem.projectsPage:
        return 0;
      case HomePageItem.privacyPolicyPage:
        return 1;
    }
  }
}
