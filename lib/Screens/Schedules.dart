import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                icon: Icon(Icons.tune_rounded),
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
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              hintText: "Search",
              focusColor: Colors.black,
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
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
              color: Colors.black87,
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
                            colors: [Colors.black, Colors.black12])),
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
                              MaterialStateProperty.all(Colors.black87),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          )),
                      onPressed: () {},
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
