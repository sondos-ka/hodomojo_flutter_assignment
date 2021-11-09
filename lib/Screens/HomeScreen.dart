
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodomojoflutterassignment/Constants/colors.dart';
import 'package:hodomojoflutterassignment/Services/content.dart';
import 'package:hodomojoflutterassignment/Widgets/ImageWidget.dart';
import 'package:hodomojoflutterassignment/Widgets/ScrollIndicator.dart';
import 'package:hodomojoflutterassignment/Widgets/TextWidget.dart';
import 'package:sizer/sizer.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    ScrollController  myScrollController= new ScrollController();

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType)
    {
      return Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: getData(),
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return

                Stack(
                  children: [

                    SingleChildScrollView(
                      controller: myScrollController,


                      child: SafeArea(
                        child: Container(
                          child:Column(
                            children: [

                             Stack(
                                children: [
                                  Container(
                                      child: ImageWidget(CoverUrl)),



                                ],
                              ),
                              Stack(
                                children: [

                                Container(
                                  height: MediaQuery.of(context).size.height*4.4,
                                    child: IgnorePointer(
                                      child: ListView.builder(itemCount: snapshot.data!.length,

                                          itemBuilder: (BuildContext context, int index) {
                                            var type = snapshot.data![index]["type"];

                                            return type == "image"
                                                ? ImageWidget(snapshot.data![index]["url"])
                                                : textDetailsWidget(
                                                snapshot.data![index]["title"],
                                                snapshot.data![index]["desc"]);
                                          }


                                      ),
                                    ),
                                  ),

                                ],
                              )



                            ],
                          )




                          /* GridView.builder(
                            controller: myScrollController
                              ,

                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 1,
                                 childAspectRatio: height/100

                               ),
                               itemCount: snapshot.data!.length,
                               itemBuilder: (BuildContext context, int index) {
                                 var type = snapshot.data![index]["type"];
                                if(type=="image"){
                                  height=30;
                                }
                                else{height=100;}

                                 return type == "image"
                                     ? ImageWidget(snapshot.data![index]["url"])
                                     : textDetailsWidget(
                                       snapshot.data![index]["title"],
                                     snapshot.data![index]["desc"]);
                               }


                          )*/
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,40,20,0),
                      child: ScrollIndicatore(

                        alignment: Alignment.topRight,

                        scrollController: myScrollController,
                        width:8,
                        height: 120,
                        indicatorHeight: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.grey[400]),
                        indicatorDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)),

                      ),
                    ),
                  ],
                );
            }
            return Center(
              child: CircularProgressIndicator(color: cDarkBlue,),
            );
          },
        ),
      );
    });

  }
}
