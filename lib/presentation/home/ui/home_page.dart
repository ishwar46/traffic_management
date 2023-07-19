import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trafficnepal/presentation/login/login_page.dart';
import 'package:trafficnepal/presentation/screens/emergency_page.dart';
import 'package:trafficnepal/presentation/screens/south/south_light.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/widgets/drawer.dart';
import '../../login/login_page_new.dart';
import '../../screens/east/east_light.dart';
import '../../screens/north/north_light.dart';
import '../../screens/west/westlight.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Dashboard'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: "Nunito",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, "/setting");
          
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: MyTabbedPage(),
      drawer: DrawerWidget(),
    );
  }
}

void _logout(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.topSlide,
    showCloseIcon: true,
    closeIcon: const Icon(Icons.close),
    title: 'Logout',
    desc: 'Are You Sure Want To Logout?',
    btnCancelOnPress: () {},
    onDismissCallback: (type) {
      debugPrint('Dialog Dismiss from callback $type');
    },
    btnOkOnPress: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  LoginPage(
            onTap: () {
              _logout(context);
            },
          ),
        ),
      );
    },
  ).show();
}

class MyTabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                      child: ModePage(),
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

//manual mode
