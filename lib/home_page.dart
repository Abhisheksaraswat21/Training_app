import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:training_app/video_info.dart';

import 'colors.dart' as color;



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//varoable of list type

  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      //the decoded file is saved here
      setState(() {
         info = json.decode(value);
      });
     
    });
  }

  @override
  void initState() {

    super.initState();

//_ lgaane se privste funciton bante hai..mtlb sirf usi file me use honge baakio me ni
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training ",
                  style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Expanded(child: Container()),

//pehle humne icons bnaayen then we see ki wo training se chik=pak rhe the
//to xpanded me container dal dia taaki wo rightmost shift hojaaye

                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),

                SizedBox(
                  width: 10,
                ),

                Icon(Icons.calendar_today_outlined,
                    size: 20, color: color.AppColor.homePageIcons),

                SizedBox(
                  width: 15,
                ),

                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: color.AppColor.homePageIcons,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Row(
              children: [
                Text(
                  "Your Program ",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Expanded(child: Container()),
//expanded takes all the available space..jinke bhi beech me daala hai

                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),

                SizedBox(width: 5),

                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                )
              ],
            ),

            SizedBox(
              height: 20,
            ),

            //ye purple waala box hai

            Container(
              //this will give width as much as screen
              //mltb staring me jo padding humne di thi uske according adjust krke width dedega

              width: MediaQuery.of(context).size.width,
              height: 220,

              decoration: BoxDecoration(

//when container and box decoration used together then boxdecoration takes the color
//property

//agr colour mixde chahiye to us case me hum color property ko use na krke gradient ka use
//krte hai...usme linergradient property ko use krke list daalte hai colours ki jo mix krne hai

                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ],

                    //begin ka mtlb colour kaha se shuru hoga..is case me bottomleft sbse dark hone wala hai

                    begin: Alignment.bottomLeft,

                    //end pe lightest hoga..yha pe end hoga

                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),

//isko dekh lena ek baar ye kya krta hai
//ye shadow bnaane ke liye use hota hia
                  boxShadow: [
                    //ye list leta hai mtlb kaafi box shadows can be used together

                    BoxShadow(
                      //offset tells how  much it should spread
                      //from left to right come down 5 px
                      //from topm to bottom come down 10 px
                      offset: Offset(5, 10),

                      //the higher blur radius the lighter the colour is
                      blurRadius: 20,

                      //this is shadow color
                      color: color.AppColor.gradientSecond.withOpacity(0.2),
                    )
                  ]),

              //AB BOX ME TEXT KO DAALENGE ----

              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),

//column doesnt take padding directly so we wrap it around a container

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Next Workout",
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.homePageContainerTextSmall,
                      ),
                    ),

//THIS WAY OF WRITING IN ROWS IS ALSO CORRECT ---

//      Row(
//        children: [
//  Text(
//         "Legs Toning",
//         style:  TextStyle(
//           fontSize: 25,
//           color: color.AppColor.homePageContainerTextSmall,
//         ),),

//        ],
//      ) ,

//   SizedBox(height:5),

//   Row( children: [

// Text(
//         "and Glutes Workout",
//         style:  TextStyle(
//           fontSize: 25,
//           color: color.AppColor.homePageContainerTextSmall,
//         ),),

//   ],)

                    SizedBox(
                      height: 25,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //isse sab niche push hojaata hai aur end se shuru hota hai

                      children: [
//wo timer wala icon aur 60 min ko row ke andar alag se row dedi aur right waale icon ko
//alag se dedenge row...esa krna zroori bhi ni tha..ek hi row me expanded krke bhi hojaata

                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),

                        Expanded(child: Container()),

//ab us rightmost waale icon ko daal dia isme --

// is icon ko shadow dene ke liye isko container me daal dia taaki fir box decoration
//se boxshadow de paaye
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4, 8),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 5),

            //NICHE JO EK LADY BANI HAI WO WAALA CONTAINER HAI AB ---
            Container(
              height: 180,
              //   color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                //stack me items overlap krpaate hai

                children: [
                  //ye left most icon jo ladki se piche hai usko banaya hai humne
                  Container(

                      // ye container bas jo image hai uske liye banaya hai
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/card.jpg"),
                              //border ni dikh rhe the image ke aur upar wale contaienr me wo thoda
                              //fit ni hora tha to fit property lagaai

                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3),
                            ),

//ab ek shadow upar bhi dedete hai ...ese hii
                            BoxShadow(
                              blurRadius: 40,
                              offset: Offset(-1, -5),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3),
                            )
                          ])),

// Ab wo ladki ki image ko set krenge

                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 200, bottom: 30),
                      //

                      decoration: BoxDecoration(
                        //    color: Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/figure.png"),
                          //border ni dikh rhe the image ke aur upar wale contaienr me wo thoda
                          //fit ni hora tha to fit property lagaai

                          // fit: BoxFit.fill
                        ),
                      )),

//AB LADKI KE SIDE ME TEXT HAIi USKE LIYE KRNA HAI ---

                  Container(
                    //max finite takes availabe wodth within your container
                    width: double.maxFinite,
                    height: 100,
//  color: Colors.redAccent.withOpacity(0.3),
                    margin: const EdgeInsets.only(left: 150, top: 50),

                    child: Column(
//taaki text center ki jagah column ke start se left se shuru ho
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          "You are doing great!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageDetail,
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

//Ab jo niche text hai usko text se bhi krskte hai pr rich text se krenge

                        RichText(
                            text: TextSpan(

                                // \n is used for new line

                                text: "Keep it up \n",
                                style: TextStyle(
                                  color: color.AppColor.homePagePlanColor,
                                  fontSize: 16,
                                ),

//Rich text me children propert hoti hai which can take a bunch of textspan
//aur rich txt ka fyada ye hai ki jo abhi upar style di thi wo children me bhi aaygai
//to code short ban gya

                                children: [
                              TextSpan(
                                text: "stick to your plan",
                              )
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),

//AREA TO FOCUS WALA TEXT ---

            Row(
              children: [
                Text(
                  "Area to focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                )
              ],
            ),

//SizedBox(height: 30,),




//WO NICHE CARD BANAYNGE AB ---

            Expanded(
              child: OverflowBox(

//listview ko overflow box mer wrap kia taaki maxwidth proprty lgaade
//padding di hui thi pehle upar to usse suze poora ni hora tha..to us width ko poora use
//krne ke liye overflowbox use kia

          maxWidth: MediaQuery.of(context).size.width,

//we wrapped this listview builder in media query remove padding taaki padding remove krpaaye
//jo bhi wxtre thi...mere case me ni thi maine bs sync rhe isiliye daal di 

                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      //list view builder se ye loop me create hote hai and jitna item count utne items
                      //banaenge

//info variable upar banaya hai maine...usme json file se data lere hai
//aur us variable me aara hai

                      itemCount: ((info.length.toDouble() / 2).toInt()), //2 return hoga
                      // itemCount: info.length,
                      itemBuilder: (_, i) {

                        int a = 2 * i;
                        int b = 2 * i + 1;

                        //mtlb jab tk itemcount ki value ko reach ni krega tbtk ye
                        //roow return krega and row me do container hai to
                        //do item return honge ek row me
                        return Row(
                          children: [
                            Container(
                              height: 170,
                              
                              width: (MediaQuery.of(context).size.width-90)/2,
   //abhi hume 30 start me 30 beech  me 30 end me spacing chahiye to ab humne width me se
   //90 miinus krdia aur divide by 2 means row ke element ko half half space milega tab 

                            margin: EdgeInsets.only(left: 30, bottom: 15, top: 15),

                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    //  image: AssetImage("assets/ex1.png")),

                                  image: AssetImage(
                                    info[a]['img'], )),

                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    ),

                                    //for top shadow only we give -ve value

                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    )
                                  ]),

                              //ab hume text bhi chahiye har image ke niche

                              child: Center(
                                //ab text center to hoyga pr usko thoda niche krna hai to humne align me
                                //wrap krdia...align me aligmnet proprty hoti hai usse bottomcenter krdia

// vese contaienr me daalke  margin: const EdgeInsets.only(left: 40.0, right: 20.0 , top: 60),
// ese bhi krskte the

                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                     info[a]["title"],
                                   // "glues",

                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 170,
                              width: (MediaQuery.of(context).size.width-90)/2,

                            margin: EdgeInsets.only(left: 30, bottom: 15, top: 15),


                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    //  image: AssetImage("assets/ex1.png")),

                                  image: AssetImage(
                                    info[b]['img'],),),

                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(5, 5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    ),

                                    //for top shadow only we give -ve value

                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-5, -5),
                                      color: color.AppColor.gradientSecond
                                          .withOpacity(0.1),
                                    )
                                  ]),

                              //ab hume text bhi chahiye har image ke niche

                              child: Center(
                                //ab text center to hoyga pr usko thoda niche krna hai to humne align me
                                //wrap krdia...align me aligmnet proprty hoti hai usse bottomcenter krdia

// vese contaienr me daalke  margin: const EdgeInsets.only(left: 40.0, right: 20.0 , top: 60),
// ese bhi krskte the

                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                     info[b]["title"],
                                 //   "glues",

                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
