import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_app/pages/bottomnav_screens/booking_screen.dart';
import 'package:thera_app/pages/bottomnav_screens/chat_screen.dart';
import 'package:thera_app/pages/bottomnav_screens/home_screen.dart';
import 'package:thera_app/pages/bottomnav_screens/profile_screen.dart';
import 'package:thera_app/theme/colors.dart';



class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeDashboardScreen(),
    ChatScreen(),
    BookingScreen (),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        height: 60.h,
        selectedIndex: _currentIndex,
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        // indicatorColor: AppColors.primary,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        // unselectedItemColor: Color.fromRGBO(50, 50, 50, 0.5),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            );
          }
          return TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          );
        }),
        labelPadding: EdgeInsets.zero,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            selectedIcon: Icon(
              Icons.home,
              color: AppColors.green,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.chat,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            selectedIcon: Icon(
              Icons.chat,
              color: AppColors.green,
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.event_available,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            selectedIcon: Icon(
              Icons.event_available,
              color: AppColors.green,
            ),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            selectedIcon: Icon(
              Icons.account_circle_outlined,
              color: AppColors.green,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
