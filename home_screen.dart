import 'package:ch5/screen_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home_screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("WhatsApp"),
          bottom: TabBar(tabs: [
            Tab(
              child: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text(' Chat'),
            ),
            Tab(
              child: Text('Status'),
            ),
            Tab(
              child: Text('Call'),
            )
          ]),
          actions: [
            //
            // Icon(Icons.search),
            PopupMenuButton(
                icon: Icon(Icons.search),
                itemBuilder: (
                  context,
                ) =>
                    [
                      PopupMenuItem(value: 1, child: Text("New Contact")),
                      PopupMenuItem(value: 2, child: Text("Contact"))
                    ]),
            SizedBox(
              width: 10,
            ),
            // Icon(Icons.more_horiz),
            PopupMenuButton(
                icon: Icon(Icons.more_horiz_rounded),
                itemBuilder: (
                  context,
                ) =>
                    [PopupMenuItem(value: 1, child: Text("New Groups")),
                      PopupMenuItem(value: 2, child: Text("Setting")),
                      PopupMenuItem(value: 3, child: Text("Log out")),
                    ]),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: TabBarView(children: [
          // Camera view

           Center(
             child: CircleAvatar(
               backgroundImage: AssetImage
                 ("Image/Ahmed.jpg"),
               radius: 200,
             ),
           ),
          // Chat box

          ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Mmuzammil Ahmed"),
                  trailing: Text("10;35 am"),
                  subtitle: Text("How are you ?"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("Image/Ahmed.jpg"),
                  ),
                );
              }),

          /// Status code
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.teal, width: 3)),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("Image/Ahmed.jpg"),
                    ),
                  ),
                  title: Text("Muzammil"),
                  subtitle: Text("32 minutes ago"),
                );
              }),

          // Call code
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Ahmad"),
                  subtitle: Text(index % 2 == 0
                      ? " you missed call"
                      : "You always missed video 10 call"),
                  trailing: Icon(
                      index % 2 == 0 ? Icons.phone : Icons.video_camera_back),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Image/Ahmed.jpg'),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
