import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Logs extends StatefulWidget {
  const Logs({super.key});

  @override
  State<Logs> createState() => _LogsState();
}

class _LogsState extends State<Logs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Logs",
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tune,
                size: 30,
                color: Colors.black54,
              )),
        ],
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => Container(
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
                            "Executed on 2021/07/3 Thursday 9 pm",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            timeago
                                .format(DateTime.parse(
                                    '2023-06-10 05:21:37.712498'))
                                .toString(),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 11),
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.music_note,
                                  color: Colors.grey),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
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
      ),
    );
  }
}
