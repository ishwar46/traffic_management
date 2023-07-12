import 'package:flutter/material.dart';
import 'package:trafficnepal/presentation/login/login_page.dart';

import '../../../utils/app_colors.dart';
import '../../screens/traffic_four.dart';
import '../../screens/traffic_one.dart';
import '../../screens/traffic_three.dart';
import '../../screens/traffic_two.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        title: Text('Dashboard'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: MyTabbedPage(),
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}

class MyTabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Light 1',
                  ),
                  Tab(
                    text: 'Light 2',
                  ),
                  Tab(
                    text: 'Light 3',
                  ),
                  Tab(
                    text: 'Light 4',
                  ),
                ],
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.black,
                indicatorColor: AppColors.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: TabBarView(
                  children: [
                    Center(
                      child: TrafficLight_One(),
                    ),
                    Center(
                      child: TrafficLight_Two(),
                    ),
                    Center(
                      child: TrafficLight_Three(),
                    ),
                    Center(
                      child: TrafficLight_Four(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
