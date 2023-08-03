import 'package:audioplayers/audioplayers.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:schedulerapp/Screens/SelectTrack.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  TextEditingController searchTextController = TextEditingController();
  double width = 0;
  bool play = false;
  bool selected = false;
  List<int> isSelected = [];
  double pos = 0.0;
  final player = AudioPlayer();
  late BetterPlayerController _betterPlayerController;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  musicload() async {
    player.onPositionChanged.listen((event) {
      // print(event);
      setState(() {
        position = event;
      });
    });
    await Future.delayed(Duration(seconds: 1));
    musicload();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    musicload();

    player.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    player.onPositionChanged.listen((event) {
      // print(event);
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff232940),
      appBar: AppBar(
        backgroundColor: Color(0xff232940),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 30,
              color: Colors.white70,
            )),
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
              hintText: "Search Tracks in Playlist",
              focusColor: Colors.black,
              hintStyle: const TextStyle(color: Colors.white54),
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
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => SwipeTo(
                //iconOnRightSwipe: CupertinoIcons.delete,
                iconSize: 20,
                rightSwipeWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.delete, color: Colors.red),
                ),
                onLeftSwipe: () {
                  setState(() {
                    selected = true;
                    isSelected.add(index);
                  });
                },
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
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                    width: MediaQuery.of(context).size.width / 1.22,
                    height: 90,
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
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Text(
                              "File Name",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                            Row(
                              children: [
                                Text(
                                  "3:23",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "|",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "9:56",
                                  style: TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                                index.isEven
                                    ? CupertinoIcons.music_note
                                    : CupertinoIcons.videocam_fill,
                                color: Colors.white60),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                                onPressed: () async {
                                  //musicload();
                                  //final player = AudioPlayer();
                                  if (index.isEven) {
                                    player.play(UrlSource(
                                        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
                                    setState(() {
                                      play = true;
                                    });
                                    showModalBottomSheet(
                                        //expand: false,
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context, setState) {
                                            player.onPositionChanged
                                                .listen((event) {
                                              // print(event);
                                              setState(() {
                                                position = event;
                                              });
                                            });
                                            return SizedBox(
                                              height: width / 1.3,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(15),
                                                    height: width / 1.3,
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Track Name",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black54,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            18),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "File Name",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            16),
                                                                  ),
                                                                ],
                                                              ),
                                                              IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    if (play ==
                                                                        true) {
                                                                      player
                                                                          .pause();
                                                                      setState(
                                                                          () {
                                                                        play =
                                                                            false;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        play =
                                                                            true;
                                                                      });
                                                                      player.play(
                                                                          UrlSource(
                                                                              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
                                                                    }
                                                                  },
                                                                  icon: Icon(
                                                                    play == true
                                                                        ? CupertinoIcons
                                                                            .pause
                                                                        : CupertinoIcons
                                                                            .play_arrow,
                                                                    size: 30,
                                                                  ))
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Slider(
                                                            value: position
                                                                .inSeconds
                                                                .toDouble(),
                                                            activeColor:
                                                                Colors.black,
                                                            //ropeLength: 150,
                                                            //showRope: false,
                                                            min: 0,
                                                            max: duration
                                                                .inSeconds
                                                                .toDouble(),
                                                            inactiveColor:
                                                                Colors.grey,
                                                            onChangeStart:
                                                                (val) {
                                                              player.pause();
                                                            },
                                                            onChanged: (val) {
                                                              player.seek(Duration(
                                                                  seconds: val
                                                                      .toInt()));
                                                              // player.resume();
                                                            },
                                                            onChangeEnd: (val) {
                                                              print(val);
                                                              player.seek(Duration(
                                                                  seconds: val
                                                                      .toInt()));
                                                              player.resume();
                                                            },
                                                            //color: Colors.black
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "${(position).inMinutes.remainder(60).toString()} : ${(position).inSeconds.remainder(60).toString()}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              Text(
                                                                "${(duration).inMinutes.remainder(60).toString()} : ${(duration).inSeconds.remainder(60).toString()}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28))),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: SizedBox(
                                                      height: width / 3,
                                                      child: WaveWidget(
                                                        config: CustomConfig(
                                                          colors: [
                                                            Colors.black87,
                                                            Colors.black12,
                                                            Colors.black45,
                                                          ],
                                                          durations: [
                                                            5000,
                                                            4000,
                                                            3000,
                                                          ],
                                                          heightPercentages: [
                                                            0.65,
                                                            0.45,
                                                            0.56,
                                                          ],
                                                        ),
                                                        backgroundColor:
                                                            Colors.white,
                                                        size: Size(
                                                            double.infinity,
                                                            double.infinity),
                                                        waveAmplitude: 2,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        }).then((value) => player.stop());
                                  } else {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context, setState) {
                                            BetterPlayerDataSource
                                                betterPlayerDataSource =
                                                BetterPlayerDataSource(
                                                    BetterPlayerDataSourceType
                                                        .network,
                                                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
                                            _betterPlayerController =
                                                BetterPlayerController(
                                                    BetterPlayerConfiguration(),
                                                    betterPlayerDataSource:
                                                        betterPlayerDataSource);
                                            return Container(
                                              height: width,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  28),
                                                          topRight:
                                                              Radius.circular(
                                                                  28))),
                                              child: Stack(children: [
                                                Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 20),
                                                    child: AspectRatio(
                                                      aspectRatio: 16 / 9,
                                                      child: BetterPlayer(
                                                        controller:
                                                            _betterPlayerController,
                                                      ),
                                                    )),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: SizedBox(
                                                    height: width / 3,
                                                    child: WaveWidget(
                                                      config: CustomConfig(
                                                        colors: [
                                                          Colors.black87,
                                                          Colors.black12,
                                                          Colors.black45,
                                                        ],
                                                        durations: [
                                                          5000,
                                                          4000,
                                                          3000,
                                                        ],
                                                        heightPercentages: [
                                                          0.65,
                                                          0.45,
                                                          0.56,
                                                        ],
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                      size: Size(
                                                          double.infinity,
                                                          double.infinity),
                                                      waveAmplitude: 2,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            );
                                          });
                                        });
                                  }
                                },
                                icon: Icon(
                                  CupertinoIcons.play_arrow,
                                  color: Colors.white,
                                )),
                            Visibility(
                              visible: selected,
                              child: GestureDetector(
                                onTap: () {
                                  if (isSelected.contains(index) == true) {
                                    setState(() {
                                      isSelected.remove(index);
                                    });
                                  } else {
                                    setState(() {
                                      isSelected.add(index);
                                    });
                                  }
                                },
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: Color(0xff333761),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color(0xff333761),
                                      width: 2,
                                    ),
                                  ),
                                  child: isSelected.contains(index)
                                      ? Icon(
                                          Icons.check_box_rounded,
                                          color: Colors.white60,
                                          size: 25,
                                        )
                                      : Icon(
                                          Icons.check_box_outline_blank,
                                          color: Colors.white70,
                                          size: 25,
                                        ),
                                ),
                              ),
                            )
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
          Visibility(
            visible: !selected,
            child: Align(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectTrack(
                                      text: 'addmul',
                                    )));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.add,
                              size: 20, color: Colors.white),
                          Text(
                            "Add Track",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
          Visibility(
            visible: selected,
            child: Align(
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
                      onPressed: () {
                        setState(() {
                          selected = !selected;
                          isSelected.clear();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.delete,
                              size: 20, color: Colors.white),
                          Text(
                            "Remove Tracks",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          )
        ],
      )),
    );
  }
}
