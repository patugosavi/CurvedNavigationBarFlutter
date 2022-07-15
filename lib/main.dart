import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_navigation_bar_flutter/pages/favourite_page.dart';
import 'package:curved_navigation_bar_flutter/pages/home_page.dart';
import 'package:curved_navigation_bar_flutter/pages/profile_page.dart';
import 'package:curved_navigation_bar_flutter/pages/search_page.dart';
import 'package:curved_navigation_bar_flutter/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainPage(title: 'Curved Navigation Bar'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
  int index=2;

  final screens=[
    HomePage(),
    SearchPage(),
    FavouritePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items=<Widget>[
      Icon(Icons.home,size: 30),
      Icon(Icons.search,size: 30),
      Icon(Icons.favorite,size: 30),
      Icon(Icons.settings,size: 30),
      Icon(Icons.person,size: 30),
    ];
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.red,
            appBar: AppBar(
              title: Text(widget.title),
              elevation: 0,
              centerTitle: true,
            ),
             body: screens[index],
             /*Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:[ Text('$index',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 120,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
               SizedBox(height: 16,),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       onPrimary: Colors.black,
                       primary: Colors.white,
                       minimumSize: Size(250, 56),
                     ),
                     child: Text('Go to 0',style: TextStyle(fontSize: 16),),
                     onPressed: (){
                       final navigationState=navigationKey.currentState!;

                       navigationState.setPage(0);
                     },
                   ),
               ],
               ),
             ),*/
             bottomNavigationBar: Theme(
               data: Theme.of(context).copyWith(
                 iconTheme: IconThemeData(color: Colors.white)
               ),
               child: CurvedNavigationBar(
                 key: navigationKey,
                 color: Colors.blue,
                 buttonBackgroundColor: Colors.purple,
                 backgroundColor: Colors.transparent,
                 height: 60,
                 animationCurve: Curves.easeInOut,
                 animationDuration: Duration(milliseconds: 300),
                 index: index,
                 items: items,
                 onTap: (index)=>setState(()=>this.index=index),
               ),
             ),
          ),
        ),
      ),
    );
  }
}
