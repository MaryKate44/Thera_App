import 'package:flutter/material.dart';
import 'package:thera_app/theme/colors.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plain,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(168, 213, 186, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    "Skylar Johnson",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "skyjohnson12@gmail.com",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Bookings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(168, 213, 186, 1),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            const SizedBox(width: 8),
            const Text(
              "Welcome back Skylar",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upcoming Session",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Color.fromRGBO(168, 213, 186, 0.4),
              child: ListTile(
                title: Text(
                  "With Dr. Amanda",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Today, 5:00 PM"),
                trailing: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,  //Color.fromRGBO(168, 213, 186, 1),
                  ),
                  child: Text("Join"),
                ),
              ),
            ),

            SizedBox(height: 24),
            Text(
              "Recent Chats",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  chatTile("Dr. Amanda"),
                  chatTile("Dr. James"),
                  chatTile("Dr. Grace"),
                  chatTile("Dr. Noah"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chatTile(String name) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage("assets/images/avatar_placeholder.png"),
          ),
          SizedBox(height: 4),
          Text(
            name,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
