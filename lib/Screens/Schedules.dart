import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:schedulerapp/Screens/CreateSchedules.dart';
import 'package:schedulerapp/Screens/EditSchedules.dart';
import 'package:swipe_to/swipe_to.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

double width = 0;
TextEditingController searchTextController = TextEditingController();

class _SchedulesState extends State<Schedules> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff232940),
      appBar: AppBar(
        backgroundColor: Color(0xff232940),
        elevation: 0,
        title: Container(
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
              suffixIcon: PopupMenuButton<String>(
                icon: Icon(
                  Icons.tune_rounded,
                  color: Colors.white54,
                ),
                onSelected: (value) {
                  // Handle menu item selection
                  if (value == 'option1') {
                    // Handle option 1
                  } else if (value == 'option2') {
                    // Handle option 2
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'Filter by',
                    child: Text('Filter by'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Time',
                    child: Text('Time'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Type of Track',
                    child: Text('Type of Track'),
                  ),
                ],
              ),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.white60,
              ),
              filled: true,
              fillColor: Color(0xff333761),
              hintText: "Search Schedules",
              focusColor: Colors.black,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff333761), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff333761), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
        ),
        actions: [],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 30,
              color: Colors.white70,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) => SwipeTo(
                  iconSize: 20,
                  rightSwipeWidget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.delete, color: Colors.red),
                  ),
                  onRightSwipe: () {
                    Dialogs.bottomMaterialDialog(
                        msg: 'Are you sure? you can\'t undo this action',
                        title: 'Delete',
                        context: context,
                        actions: [
                          IconsOutlineButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            text: 'Cancel',
                            iconData: Icons.cancel_outlined,
                            textStyle: TextStyle(color: Colors.grey),
                            iconColor: Colors.grey,
                          ),
                          IconsButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            text: 'Delete',
                            iconData: Icons.delete,
                            color: Colors.red,
                            textStyle: TextStyle(color: Colors.white),
                            iconColor: Colors.white,
                          ),
                        ]);
                  },
                  child: Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Schedule Name",
                                style: TextStyle(
                                    color: Colors.white60,
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
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.music_note,
                                  color: Colors.white54),
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
                          color: Color(0xff333761), // Set the border color here
                          width: 0.5, // Set the border width here
                        ),
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            colors: [Color(0xff040c29), Color(0xff040c29)])),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              right: width / 5,
                              left: width / 5,
                              top: 15,
                              bottom: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff040c29)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          )),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateSchedule()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.add,
                              size: 20, color: Colors.white),
                          Text(
                            "Create Schedules",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
