import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:schedulerapp/Screens/Logs.dart';
import 'package:schedulerapp/Screens/Schedules.dart';
import 'package:schedulerapp/Screens/TimeSetting.dart';
import 'package:schedulerapp/Screens/Tracks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TextEditingController searchTextController = TextEditingController();
  PageController pageController = PageController();
  dynamic _currentTime = '';
  late TabController tabController;
  final zoomDrawerController = ZoomDrawerController();

  int current_page = 1;

  @override
  void initState() {
    super.initState();

    _updateTime();
    tabController =
        TabController(length: 2, vsync: this); // Initial update of the time
  }

  Future<void> _updateTime() async {
    setState(() {
      _currentTime = DateFormat.jm().format(DateTime.now());
    });

    // Update the time every second
    await Future.delayed(Duration(seconds: 1));
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: Material(
        color: Colors.black87,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    leading: Icon(
                      CupertinoIcons.home,
                      color: Colors.white60,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tracks()));
                    },
                    leading: Icon(
                      CupertinoIcons.music_note,
                      color: Colors.white60,
                    ),
                    title: Text(
                      "Tracks",
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Schedules()));
                    },
                    leading: Icon(
                      CupertinoIcons.bookmark,
                      color: Colors.white60,
                    ),
                    title: Text(
                      "Schedules",
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimeSetting()));
                    },
                    leading: Icon(
                      CupertinoIcons.time,
                      color: Colors.white60,
                    ),
                    title: Text(
                      "Time Setting",
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Logs()));
                    },
                    leading: Icon(
                      CupertinoIcons.list_bullet_below_rectangle,
                      color: Colors.white60,
                    ),
                    title: Text(
                      "Logs Page",
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
      menuBackgroundColor: Colors.black45,
      reverseDuration: Duration(milliseconds: 1000),
      drawerShadowsBackgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      mainScreen: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Center(
              child: Text(
                "Logo",
                style: TextStyle(color: Colors.black),
              ),
            ),
            actions: [
              IconButton(
                  color: Colors.grey,
                  onPressed: () {
                    zoomDrawerController..toggle?.call();
                  },
                  icon: Icon(Icons.sort_rounded))
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: const Offset(12, 26),
                            blurRadius: 50,
                            spreadRadius: 0,
                            color: Colors.grey.withOpacity(.1)),
                      ]),
                      child: TextField(
                        controller: searchTextController,
                        onChanged: (value) {
                          //Do something wi
                        },
                        decoration: InputDecoration(
                          ////suffixIcon: IconButton(
                          //    onPressed: () {},
                          //   icon: Icon(
                          //     Icons.tune,
                          //     color: Colors.purple,
                          //  )),
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          hintText: "Search",
                          hintStyle: const TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Time On Scheduler",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            Text(
                              _currentTime,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$_currentTime -Mobile",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 2.8,
                          height: 80,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "100 Schedules",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "10 Active",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.grey, // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Currently Executing",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Track Name",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                              "Every Thursday 9 pm",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/music-player.png",
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey, // Set the border color here
                        width: 0.5, // Set the border width here
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 30,
                    child: TabBar(
                        automaticIndicatorColorAdjustment: true,
                        dividerColor: Colors.black87,
                        indicatorColor: Colors.black54,
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey.shade400,
                        labelColor: Colors.black54,
                        controller: tabController,
                        onTap: (c) {
                          pageController.animateToPage(c,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        tabs: [
                          SizedBox(
                            height: 50,
                            child: Text(
                              "Upcoming",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  //color: Colors.black54,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(
                              "Executed",
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                  // color: Colors.black54,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        current_page = index;
                        tabController.animateTo(index);
                      });
                    },
                    children: [
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 100,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Schedule Name",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Track Name",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Every Thursday 9 pm",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.music_note,
                                        color: Colors.grey),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit_outlined))
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey, // Set the border color here
                                width: 0.5, // Set the border width here
                              ),
                            )),
                      ),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 100,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Schedule Name",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Track Name",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Every Thursday 9 pm",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.music_note,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.edit_outlined))
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey, // Set the border color here
                                width: 0.5, // Set the border width here
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
