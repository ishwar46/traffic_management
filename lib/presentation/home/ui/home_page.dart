import 'package:flutter/material.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_first.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_four.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_second.dart';
import 'package:smartftraffic/presentation/home/ui/traffic_light_third.dart';
import 'package:smartftraffic/presentation/login/login_page.dart';

import '../../../utils/app_colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() =>
      _DashboardState();
}

class _DashboardState
    extends State<Dashboard> {

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
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: (

            ) {
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
        body: TabBarView(
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
    );
  }
}