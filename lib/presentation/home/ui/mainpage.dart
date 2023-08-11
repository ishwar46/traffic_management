import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void main() {
  runApp(MyApp());
}

class AppColors {
  static const primaryColor = Colors.blue;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _logoutAlert(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close),
      title: 'Logout',
      desc: 'Do you want to logout?',
      btnCancelOnPress: () {},
      onDismissCallback: (type) {
        debugPrint('Dialog Dismiss from callback $type');
      },
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    ).show();
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              _logoutAlert(context);
            },
          ),
        ],
      ),
      body: MyTabbedPage(),
      drawer: DrawerWidget(),
    );
  }
}

class MyTabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
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
                    text: 'SLOT LOT',
                  ),
                  Tab(
                    text: 'MANUAL MODE',
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
                    Center(
                      child: SlotLot(),
                    ),
                    Center(
                      child: ManualMode(),
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

class ModePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MODES PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class EastLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'EAST LIGHT PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class WestLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'WEST LIGHT PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class NorthLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'NORTH LIGHT PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class SouthLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SOUTH LIGHT PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class SlotLot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SLOT LOT PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ManualMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MANUAL MODE PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SETTINGS PAGE',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2
            },
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text(
          'Login Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
