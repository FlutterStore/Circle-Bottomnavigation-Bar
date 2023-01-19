
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Circle Nav Bar",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
        centerTitle: true,
      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.green),
          Icon(Icons.person, color: Colors.green),
          Icon(Icons.favorite, color: Colors.green),
          Icon(Icons.settings_rounded, color: Colors.green),
          Icon(Icons.bookmark_rounded, color: Colors.green),
        ],
        inactiveIcons: const [
          Text("Home"),
          Text("Profile"),
          Text("Like"),
          Text("Setting"),
          Text("Bookmark"),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.green,
        elevation: 2,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Container(
            width: double.infinity, 
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text("Profile Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Container(
            width: double.infinity, 
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text("Like Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Container(
            width: double.infinity, 
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text("Setting Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Container(
            width: double.infinity, 
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text("Bookmark Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
      ),
    );
  }
}