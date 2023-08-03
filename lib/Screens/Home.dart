import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:intl/intl.dart';
import 'package:schedulerapp/Screens/EditSchedules.dart';
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
  PageController pageController = PageController(initialPage: 0);
  dynamic _currentTime = '';
  late TabController tabController;
  final zoomDrawerController = ZoomDrawerController();

  int current_page = 1;

  @override
  void initState() {
    super.initState();

    _updateTime();
    tabController =
        TabController(length: 3, vsync: this); // Initial update of the time
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
      style: DrawerStyle.style1,
      menuScreen: Material(
        color: Color.fromARGB(255, 22, 25, 42),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Color.fromARGB(255, 22, 25, 42),
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
      angle: 0,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
      menuScreenTapClose: true,
      menuBackgroundColor: Color(0xff232940),
      reverseDuration: Duration(milliseconds: 1000),
      drawerShadowsBackgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      mainScreen: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xff232940),
          appBar: AppBar(
            backgroundColor: Color(0xff232940),
            elevation: 0,
            leading: Center(
              child: Text(
                "Logo",
                style: TextStyle(color: Colors.white54),
              ),
            ),
            actions: [
              IconButton(
                  color: Colors.white54,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff5ccc9b),
                            width: 2,
                          ),
                        ),
                      ),
                      height: 30,
                      width: 90,
                      child: Text(
                        "Executing",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Schedules()));
                      },
                      child: SizedBox(
                        height: 30,
                        child: Text(
                          "Schedules",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Tracks()));
                      },
                      child: SizedBox(
                        height: 30,
                        child: Text(
                          "Tracks",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Text(
                        "           ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            Text(
                              _currentTime,
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$_currentTime -Mobile",
                              style: TextStyle(
                                  color: Colors.white60,
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
                                    color: Colors.white70,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "10 Active",
                                  style: TextStyle(
                                    color: Color(0xff5ccc9b),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff333761),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Color(
                                  0xff333761), // Set the border color here
                              width: 0.5, // Set the border width here
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                /* SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Currently Executing",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),*/
                SizedBox(
                  height: 10,
                ),
                /* Container(
                  child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: 70,
                            margin: EdgeInsets.all(10),
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
                                      "Track Name",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Every Thursday 9 pm",
                                      style: TextStyle(
                                          color: Colors.white60,
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
                              color: Color(0xff333761),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(
                                    0xff333761), // Set the border color here
                                width: 0.5, // Set the border width here
                              ),
                            ));
                      }),
                ),*/
                SizedBox(
                  height: 0,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 30,
                    child: TabBar(
                        automaticIndicatorColorAdjustment: true,
                        dividerColor: Colors.black87,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 5.2),
                        indicatorColor: Color(0xff5ccc9b),
                        isScrollable: true,
                        unselectedLabelColor: Colors.white54,
                        labelColor: Colors.white,
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
                              "Current",
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
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.05,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        current_page = index;
                        tabController.animateTo(index);
                      });
                    },
                    children: [
                      ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "    Currently Executing ...",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width / 1,
                                height: 100,
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Schedule Name",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "Track Name",
                                          style: TextStyle(
                                              color: Colors.white54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Every Thursday 9 pm",
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(CupertinoIcons.music_note,
                                            color: Colors.white60),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditSchedules()));
                                            },
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.white,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff333761),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Color(
                                        0xff333761), // Set the border color here
                                    width: 0.5, // Set the border width here
                                  ),
                                )),
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width / 1,
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
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Track Name",
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Every Thursday 9 pm",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.music_note,
                                        color: Colors.white60),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditSchedules()));
                                        },
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff333761),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(
                                    0xff333761), // Set the border color here
                                width: 0.5, // Set the border width here
                              ),
                            )),
                      ),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(5),
                            width: MediaQuery.of(context).size.width / 1,
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
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Track Name",
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Every Thursday 9 pm",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.music_note,
                                        color: Colors.white60),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditSchedules()));
                                        },
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff333761),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color(
                                    0xff333761), // Set the border color here
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
