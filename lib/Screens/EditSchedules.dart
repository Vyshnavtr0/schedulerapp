import 'dart:math';

import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class EditSchedules extends StatefulWidget {
  const EditSchedules({super.key});

  @override
  State<EditSchedules> createState() => _EditSchedulesState();
}

enum TimeUnit { seconds, minutes }

class _EditSchedulesState extends State<EditSchedules> {
  String selectedScheduleName = 'Daily';
  String selectedScheduletime = '5 minutes';
  String time = '00:00';
  String date = '00:00';
  List<String> scheduleNames = ['Daily', 'Weekly', 'Monthly'];
  List<String> maxplay = [
    '5 minutes',
    '10 minutes',
    '15 minutes',
    '25 minutes',
    'Custom'
  ];
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  int _timeValue = 0;
  TimeUnit _selectedTimeUnit = TimeUnit.seconds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232940),
      appBar: AppBar(
        backgroundColor: Color(0xff232940),
        elevation: 0,
        title: Text(
          "Edit Schedule",
          style: const TextStyle(color: Colors.white60, fontSize: 16),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 30,
              color: Colors.white54,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.all(8),
                  //color: Color(0xff333761),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Schedule Name',
                      fillColor: Color(0xff333761),
                      focusColor: Color(0xff333761),
                      hoverColor: Color(0xff333761),
                      labelStyle: TextStyle(color: Colors.white60),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff333761), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  padding: EdgeInsets.all(2),
                  child: DropdownButtonFormField(
                    //decoration: textInputDecoration,
                    value: scheduleNames[0],
                    style: TextStyle(color: Colors.white60),
                    dropdownColor: Color(0xff333761),
                    items: scheduleNames.map((accountType) {
                      return DropdownMenuItem(
                        value: accountType,
                        child: Text(accountType),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedScheduleName = val!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Visibility(
                  visible: selectedScheduleName == "Weekly" ? true : false,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(12),
                    child: DropdownButtonFormField(
                      //decoration: textInputDecoration,
                      value: days[0],
                      items: days.map((accountType) {
                        return DropdownMenuItem(
                          value: accountType,
                          child: Text(accountType),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          //selectedScheduleName = val!;
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: selectedScheduleName == "Monthly" ? true : false,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: OutlinedButton(
                      onPressed: () {
                        showRoundedDatePicker(
                          context: context,
                          height: MediaQuery.of(context).size.height / 2.5,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 1),
                          lastDate: DateTime(DateTime.now().year + 1),
                          borderRadius: 16,
                          onTapDay: (dateTime, available) {
                            setState(() {
                              date =
                                  DateFormat.Md().format(dateTime).toString();
                            });

                            return true;
                          },
                        );
                        /*showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('My Dialog'),
                              content: 
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );*/
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: BorderSide(color: Colors.white60),
                      ),
                      child: Text(
                        'Date $date',
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: OutlinedButton(
                    onPressed: () {
                      // Button action Navigator.of(context).push(
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          iosStylePicker: true,
                          accentColor: Colors.black,
                          hourLabel: "Hours :",
                          okStyle: TextStyle(color: Colors.black87),
                          minuteLabel: "Minutes",
                          cancelStyle: TextStyle(color: Colors.black54),
                          value: Time(hour: 11, minute: 30, second: 20),
                          sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                          sunset: TimeOfDay(hour: 18, minute: 0), // optional
                          duskSpanInMinutes: 120, // optional
                          onChange: (c) {
                            setState(() {
                              time = c.format(context);
                            });
                          },
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide(color: Colors.white60),
                    ),
                    child: Text(
                      'Time : $time',
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: OutlinedButton(
                onPressed: () {
                  // Button action Navigator.of(context).push(
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  side: BorderSide(color: Colors.white60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Selected Track Name',
                      style: TextStyle(color: Colors.white60, fontSize: 18),
                    ),
                    Icon(CupertinoIcons.music_note,
                        size: 20, color: Colors.white60),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              child: DropdownButtonFormField(
                //decoration: textInputDecoration,
                value: selectedScheduletime,
                dropdownColor: Color(0xff333761),

                style: TextStyle(color: Colors.white60),
                items: maxplay.map((accountType) {
                  return DropdownMenuItem(
                    value: accountType,
                    child: Text(accountType),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    if (val == "Custom") {
                      showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                return AlertDialog(
                                  title: Text('Enter Time'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          setState(() {
                                            _timeValue =
                                                int.tryParse(value) ?? 0;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'Time',
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      DropdownButton<TimeUnit>(
                                        value: _selectedTimeUnit,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedTimeUnit = newValue!;
                                          });
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            value: TimeUnit.seconds,
                                            child: Text('Seconds'),
                                          ),
                                          DropdownMenuItem(
                                            value: TimeUnit.minutes,
                                            child: Text('Minutes'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle the selected time value and unit here
                                        print(
                                            'Entered time: $_timeValue ${_selectedTimeUnit.toString().split('.').last}');
                                        setState(() {
                                          selectedScheduletime =
                                              "Custom $_timeValue ${_selectedTimeUnit.name}";
                                          maxplay.add(
                                              "Custom $_timeValue ${_selectedTimeUnit.name}");
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              })).then((value) => () {});
                    }
                    //selectedScheduleName = val!;
                  });
                },
              ),
            ),
            Visibility(
              visible: false,
              child: Text(
                "$selectedScheduletime",
                style: const TextStyle(color: Colors.white60, fontSize: 16),
              ),
            ),
            Spacer(),
            Padding(
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
                            right: MediaQuery.of(context).size.width / 5,
                            left: MediaQuery.of(context).size.width / 5,
                            top: 15,
                            bottom: 15)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff040c29)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(CupertinoIcons.upload_circle,
                            size: 20, color: Colors.white),
                        Text(
                          "Update Schedule",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
