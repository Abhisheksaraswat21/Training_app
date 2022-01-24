import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:training_app/home_page.dart';

import 'package:training_app/video_info.dart';

import 'package:video_player/video_player.dart';

import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];

  bool _playArea = false;

//controler variable here is a type of videoplayercontroller
  VideoPlayerController? _controller;

  bool _isPlaying = false;

  bool _disposed = false;

  int _isPlayingIndex = -1;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      //the decoded file is saved here

      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

//everything in this is initialised before everything is build
  @override
  void initState() {
    super.initState();

//_ lgaane se privste funciton bante hai..mtlb sirf usi file me use honge baakio me ni
    _initData();
  }

  @override
  void dispose() {
    //dispose method ka use kia hai taaki jab next video chalaye tab pichle ke upar na chle ..pehli dispose hojaaye

    _disposed = true;
    //pehli video ko pause krenege ... ? means if controller exists
    _controller?.pause();

    _controller?.dispose();

    //it makes sure controller has been removed
    _controller = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //ye purple wala box decoration ki design
      //thumbnail click krne pe na dikhe tb kia hai

      decoration: _playArea == false
          ? BoxDecoration(
              gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond,
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ))
          : BoxDecoration(
              color: color.AppColor.gradientSecond,
            ),

      child: Column(
        children: [
          //YE UPAR WAALE PURPLE BOX KE LIYE HAI---
          _playArea == false
              ? Container(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          //SABSE UPAR WALE ICONS -----

                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ),

                          Expanded(child: Container()),

                          Icon(Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Text(
                        "Legs Toning ",
                        style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.secondPageTitleColor,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        "and Glutes Workout",
                        style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.secondPageTitleColor,
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),

// AB WO DO JO LIGHT PPURPPLE BOX ME  BANE HAI UNKO BANYA HAI

                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: Row(
                              //ye row ke elements ko center me kr dega
                              //ye kaam hum row se upar amrgin me bhi deskte the pr humne mainaxis align se kia
// for row mainaxisalign is the horizontal one

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(Icons.timer,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "68 min",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),

// YE DUSRA WALA LIGHT PURPLE BOX HAI ----

                          Container(
                            width: 220,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: Row(
                              //ye row ke elements ko center me kr dega
                              //ye kaam hum row se upar amrgin me bhi deskte the pr humne mainaxis align se kia
// for row mainaxisalign is the horizontal one

                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Resistent band, kettlebell",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          color.AppColor.secondPageIconColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

              //YE BOX TB DIKHEGa JAB HUM THUMBNAIL PE CLICK KRENGE

              : Container(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        padding:
                            const EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: Row(
                          children: [
                            //ye topmost icon hai
                            InkWell(
                              onTap: () {
                                debugPrint("tapped");
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageTopIconColor,
                              ),
                            ),

                            Expanded(child: Container()),

                            //ye info wala iconn hai jo topright me hai
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageTopIconColor,
                            )
                          ],
                        ),
                      ),

                      //ye function video play krega
                      _playView(context),

                      _controlView(context),
                    ],
                  ),
                ),

          //NOW THE AVAILABLE SPACE SHOULD BE WHITE NICCHE KA..TO WE ARE IN A CLOUMN
          //SO INSTEAD OF USING A NEW ROW WE CAN TAKE ALL THE SPACE BY USING EXPANDED

          Expanded(
              child: Container(
//padding: const EdgeInsets.only(right: 40),

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
            ),

            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Circuit 1: Legs Toning",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color.AppColor.circuitsColor,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(
                          Icons.loop,
                          size: 30,
                          color: color.AppColor.loopColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3 Sets",
                          style: TextStyle(
                            fontSize: 15,
                            color: color.AppColor.setsColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                // AB HUM VIDO LIST BNAAYENGE

                Expanded(child: _listView())
              ],
            ),
          ))
        ],
      ),
    ));
  }

  String convertTwo(int value) {
    //single digit me 0 lagaya hai
    return value < 10 ? "0$value" : "$value";
  }

//isme saare controllers honge video play pause etc
  Widget _controlView(BuildContext context) {
//if controller exists we get a value from it, if the value exists we get volume from it, if vol exists we use volume if it doesnt
//then we call volume 0 (volume turned off)
    final noMute = (_controller?.value?.volume ?? 0) > 0;

    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0); // ~ takes only integer part
    final secs = convertTwo(remained % 60);

    return Column(
      //mainAxisAlignment: MainAxisSize.min,
      children: [
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 2.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                )),
            child: Slider(
              value: max(0, min(_progress * 100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position?.toString().split(".")[0],
              onChanged: (value) {
                setState(() {
                  _progress = value * 0.01;
                });
              },
              onChangeStart: (value) {
                _controller?.pause();
              },
              onChangeEnd: (value) {
                final duration = _controller?.value?.duration;
                if (duration != null) {
                  var newValue = max(0, min(value, 99)) * 0.01;
                  var millis = (duration.inMilliseconds * newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                  _controller?.play();
                }
              },
            )),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 5),
          color: color.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //vollumne button
              InkWell(
                onTap: () {
                  if (noMute) {
                    //agr nomute me volume hai to 0 krdenge
                    _controller?.setVolume(0);
                  } else {
                    //wrna 1 krdenge
                    _controller?.setVolume(1.0);
                  }

                  //it makes sure that rerender happens..ye upar wala setstate me bhi daal skte the
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                      decoration: BoxDecoration(
                          //shape circle dene se shadow thodi si circle me aai hai icon ke
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(50, 0, 0, 0),
                            )
                          ]),
                      child: noMute
                          ? Icon(
                              Icons.volume_up,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.volume_off,
                              color: Colors.white,
                            )),
                ),
              ),

              //rewind button
              FlatButton(
                  onPressed: () async {
                    final index = _isPlayingIndex - 1;

                    if (index >= 0 && videoInfo.length >= 0) {
                      _initialiseVideo(index);
                    } else {
                      Get.snackbar("Video", "",
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(Icons.face, size: 30, color: Colors.white),
                          backgroundColor: color.AppColor.gradientSecond,
                          colorText: Colors.white,
                          messageText: Text(
                            "No videos ahead !",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ));
                    }
                  },
                  child: Icon(
                    Icons.fast_rewind,
                    size: 36,
                    color: Colors.white,
                  )),

              //play / pause button
              FlatButton(
                  onPressed: () async {
                    if (_isPlaying) {
                      setState(() {
                        _isPlaying = false;
                      });

                      //if it is playing then we will plause it
                      _controller?.pause();
                    } else {
                      setState(() {
                        _isPlaying = true;
                      });
                      _controller?.play();
                    }
                  },
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 36,
                    color: Colors.white,
                  )),

              //foreward button
              FlatButton(
                  onPressed: () async {
                    final index = _isPlayingIndex + 1;

                    if (index <= videoInfo.length - 1) {
                      _initialiseVideo(index);
                    } else {
                      Get.snackbar("Video", "",
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(Icons.face, size: 30, color: Colors.white),
                          backgroundColor: color.AppColor.gradientSecond,
                          colorText: Colors.white,
                          messageText: Text(
                            "No more video in the list",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ));
                    }
                  },
                  child: Icon(
                    Icons.fast_forward,
                    size: 36,
                    color: Colors.white,
                  )),
              //it is showing time in the right side --
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

//yaha pe playscreen ka function hai --
  Widget _playView(BuildContext context) {
    //this should be able to play things---

    final controller = _controller;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        //this is best aspect ratio for any device
        //acc to device it sets the width and height
        aspectRatio: 16 / 9,

        child: VideoPlayer(controller),
      );
    } else {
      //jab tk load ni hogi tb tk ye display hogi waha pe ...mtlb preparing likha aayega jb tk video load ni hogi --

      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "Preparing...",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          )));
    }
  }

  var _onUpdateControllerTime;

  Duration? _duration;
  Duration? _position;

  var _progress = 0.0;

  void _onControllerUpdate() async {
//this fn is defined in the listeener which is called many times...so to imporve the efficieny we are
//checking if the video is dispoed, then it is okay we dont go ahead

    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;

//this will give correct time in milliseconds--
    final now = DateTime.now().millisecondsSinceEpoch;

    if (_onUpdateControllerTime > now) {
      return;
    }
    //its like adding 500 sec to it..so if th fn is called too quickly and 500 seconds have not passed yet then upar se hi return krjayega

    _onUpdateControllerTime = now + 500;

    final controller = _controller;

    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      //this is to check if the controller has been initialsed or not
      debugPrint("controller cannot be initialied");
      return;
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }

    var duration = _duration;

    if (duration == null) return;

    var position = await controller.position;
    _position = position;

//ab upar dono ki value paas krne ke baad ab pakka hai ki play krra hai ..
//to wo value yaha li
    final playing = controller.value.isPlaying;

    if (playing) {
      //handle progress indicator

      if (_disposed) return;

      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.toDouble();
      });
    }

    _isPlaying = playing;
  }

  _initialiseVideo(int index) async {
    //since video is coming from a url that is a network
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);

//we save the previous controller...age ek click kiauske baad dusri click ki...to pehli waali old controller ban gai
    final old = _controller;

//we are saving everything on global variable from local variable taaki fn ke baahr use
//kr paaye
    _controller = controller;

    if (old != null) {
      old.removeListener((_onControllerUpdate));

      old.pause();
    }

    setState(() {});

//once the initialisation is done we can play the video

    controller
      ..initialize().then((_) {
        //before initialising new one we check if old one exists then we dispose it--

        old?.dispose();
        //we afer storing the index of the video here
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();

//this ensures redraw happens--
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initialiseVideo(index);
  }

  _listView() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 8,
        ),
        itemCount: videoInfo.length,

        //videoInfo.length,

        //item builder will access each of the videoinfo using index
        itemBuilder: (_, int index) {
          return GestureDetector(
            //gesture detecotor me wrap krne se click kr skte hia gesture
            //detecotr ke child ko

            onTap: () {
              debugPrint(index.toString());

              //is function se hum index paas krke video lelenge
              _onTapVideo(index);

//set state triggers signal that helps the widget to redraw

              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },

            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      //    color: Colors.red,

      child: Column(
        children: [
          //is row me image,aur uske side me do text aaye hai

          Row(
            //AB HUM VIDEO WAALI IMAGE KO SET KRRE HAI--

            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]["thumbnail"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                width: 10,
              ),

              //AB THUMBNAIL KE SAAMNE JO TEXT HAI WO SHOW KRNE HAI
              //DO TEXT HAI TO UNKO COLUMN ME DAAL DENGE

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //video ka title bhi json se aara hai
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //now to show the second text

                  //sizedbox se kaam chl jayega but humne pasdding widget bna dia
                  //padding widget me it is compulsory to give padidng.
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                  //
                ],
              ),
            ],
          ),

          // isme second part aara haii

          SizedBox(
            height: 18,
          ),

          //second part wala hai isme jo thumbnail ke neeche hai
          Row(children: [
            //ye wo box hai light purple wala thumbnail ke neeche

            Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xFFeaeefc),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                //we wrap txt in center to make it center in container

                child: Text(
                  "15 sec rest ",
                  style: TextStyle(
                    color: Color(0xFF839fed),
                  ),
                ),
              ),
            ),

            // ye jo dotted lines hai uske liye hai

            Row(
              children: [
                for (int i = 0; i < 70; i++)
                  i.isEven
                      ? Container(
                          //ye blue waale dashes ke liye hai
                          width: 3,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0xff839fed),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )
                      : Container(
                          //ye white waale dots ke liye hai
                          width: 3,
                          height: 1,
                          color: Colors.white,
                        ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
