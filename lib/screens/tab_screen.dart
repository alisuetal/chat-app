import 'package:chat/Components/nav_bar_icon_widget.dart';
import 'package:chat/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;

  late final List<Widget> _screens = [
    const HomeScreen(),
    Container(),
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: _screens[_selectedScreenIndex],
          ),
          Container(
            height: 72,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFEBEBEB),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarIconWidget(
                      icon: Icons.message,
                      inactiveIcon: Icons.message_outlined,
                      label: "Chats",
                      labelOnActive: true,
                      darkMode: false,
                      active: (_selectedScreenIndex == 0),
                      onClick: () => _selectScreen(0),
                    ),
                    NavBarIconWidget(
                      icon: Icons.settings_rounded,
                      inactiveIcon: Icons.settings_outlined,
                      label: "Settings",
                      labelOnActive: true,
                      darkMode: false,
                      active: (_selectedScreenIndex == 1),
                      onClick: () => _selectScreen(1),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
