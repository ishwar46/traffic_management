import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:trafficnepal/presentation/login/login_page.dart';
import 'package:trafficnepal/presentation/screens/emergency_page.dart';
import 'package:trafficnepal/presentation/screens/south/south_light.dart';
import 'package:trafficnepal/presentation/screens/testlight.dart';

import '../../../utils/app_colors.dart';
import '../../screens/east/east_light.dart';
import '../../screens/north/north_light.dart';
import '../../screens/traffic_one.dart';
import '../../screens/traffic_two.dart';
import '../../screens/west/westlight.dart';

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
        centerTitle: true,
        title: Text('Dashboard',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontFamily: "Nunito",
            )),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            //EasyLoading.showInfo('Feature not available yet');
          },
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
      length: 6,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: const TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  color: Colors.white,
                ),
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'MODES',
                  ),
                  Tab(
                    text: 'EAST',
                  ),
                  Tab(
                    text: 'WEST',
                  ),
                  Tab(
                    text: 'NORTH',
                  ),
                  Tab(
                    text: 'SOUTH',
                  ),
                  Tab(
                    text: 'TEST',
                  )
                ],
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: Colors.white,
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
                      child: EmergencyPage(),
                    ),
                    Center(
                      child: EastLight(),
                    ),
                    Center(
                      child: WestLight(),
                    ),
                    Center(
                      child: NorthLight(),
                    ),
                    Center(
                      child: SouthLight(),
                    ),
                    Center(
                      child: TrafficLight_One(),
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
