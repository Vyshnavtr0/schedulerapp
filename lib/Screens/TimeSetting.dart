import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';

class TimeSetting extends StatefulWidget {
  const TimeSetting({super.key});

  @override
  State<TimeSetting> createState() => _TimeSettingState();
}

class _TimeSettingState extends State<TimeSetting> {
  var _currentTime = DateTime.now();
  double width = 0;
  @override
  void initState() {
    // TODO: implement initState
    _updateTime();
    super.initState();
  }

  Future<void> _updateTime() async {
    setState(() {
      _currentTime = DateTime.now();
    });

    // Update the time every second
    await Future.delayed(Duration(seconds: 1));
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff232940),
      appBar: AppBar(
        backgroundColor: Color(0xff232940),
        elevation: 0,
        title: Text(
          "Time Setting",
          style: TextStyle(
              color: Colors.white60, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.refresh,
                size: 30,
                color: Colors.white54,
              )),
        ],
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: AnalogClock(
              dateTime: _currentTime,
              dialBorderColor: Color(0xff333761),
              dialColor: Color(0xff333761),
              centerPointColor: Colors.white,
              markingColor: Colors.white60,
              hourHandColor: Colors.white60,
              hourNumberColor: Colors.white60,
              minuteHandColor: Colors.white60,
              secondHandColor: Colors.white60,
              isKeepTime: true,
              child: Align(
                alignment: FractionalOffset(0.5, 0.75),
                child: Text(
                  DateFormat.jm().format(_currentTime).toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Time - Mobile",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            DateFormat.jm().format(_currentTime).toString(),
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                            onChange: (c) {},
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Time Manually",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            "0:00 PM",
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Time - Internet",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            DateFormat.jm().format(_currentTime).toString(),
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          )
        ],
      )),
    );
  }
}
