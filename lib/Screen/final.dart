import 'package:application2/api/ApiProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/response_model.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ResponseModel? taskdata;
  bool ontap = false;
  var myloacation = 'kolkata';
  TextEditingController mycontrol = TextEditingController();

  // bool isLoading = false;
  @override
  void initState() {
    // getAllData();
    super.initState();
    getAllData();
    //  ApiProvider.getWeatherData().then((value) {
    //  taskdata = value;
    // });

    // print("object");
  }

  // ResponseModel? taskdata;
  void getAllData() async {
    // isLoading = false;
    taskdata = (await ApiProvider.getWeatherData(location: myloacation));
    print(taskdata!.forecast!.forecastday![0].hour![0].condition!.icon!.length);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    // isLoading = true;
    //setState(() {
    //  isLoading = true;
    //});
    // });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: taskdata == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/day.jpeg'),
                      fit: BoxFit.fill),
                ),
                // bool ontap=false;
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 30, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ontap == true
                                    ? Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Container(
                                            color: Colors.yellow,
                                            width: 230,
                                            child: TextField(
                                              controller: mycontrol,
                                              decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                      //iconSize: 100,
                                                      icon: const Icon(
                                                        Icons.search,
                                                      ),
                                                      // the method which is called
                                                      // when button is pressed
                                                      onPressed: () {
                                                        myloacation =
                                                            mycontrol.text;
                                                        print(myloacation);
                                                        setState(() {
                                                          getAllData();
                                                          ontap = false;
                                                        });
                                                      }),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[800]),
                                                  hintText: "Type in your text",
                                                  fillColor: Colors.white70),
                                            )))
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            ontap = true;
                                          });
                                          print(
                                              '.......................$ontap');
                                          //   ontap = true;
                                          // Center(
                                          //     child: Container(
                                          //   width: 20,
                                          //   height: 20,
                                          //   color: Colors.black,
                                          // ));
                                        },
                                        icon: Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                      ),
                                SizedBox(
                                  width: 10,
                                ),
                                //ontap == true?
                                ontap == false
                                    ? Text(
                                        // ontap == false?
                                        //ontap ==?
                                        myloacation,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      )
                                    : Container(
                                        //color: Colors.yellow,
                                        ),

                                // SizedBox(
                                //   width: 100,
                                //),
                                //Padding(
                                // padding: const EdgeInsets.only(left: 120),

                                // )
                                //
                              ],
                            ),
                            SizedBox(
                              width: ontap == true ? 80 : 120,
                            ),
                            Container(
                              child: Icon(Icons.align_horizontal_left,
                                  color: Colors.white),
                              //color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     left: 170,
                      //   ),
                      //child: Text("I   t's Sunday"),
                      //  ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 20, top: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Padding(
                            //  padding: EdgeInsets.only(left: 10, top: 100),
                            // child:
                            Text(taskdata!.current!.gustKph.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 90,
                                    color: Colors.white)),
                            //child:Text(data)
                            // ),
                            RotatedBox(
                                quarterTurns: 1,
                                child: RichText(
                                    text: TextSpan(
                                        text: "it's is sunday",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white))))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 265,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 247, 241, 241),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),

                                // Colors.blue
                                // Color: Color.fromARGB(255, 247, 241, 241)))
                              )),
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.only(top: 35),
                                child: Center(
                                    child: Text("Weather Today",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25)))),

                            // ]),

                            // )))];
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      // taskdata!.forecast!.forecastday!.length,
                                      // taskdata!.forecast!.forecastday!.length,
                                      taskdata!.forecast!.forecastday![0].hour!
                                          .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(children: [
                                      // Container(
                                      //     margin: EdgeInsets.all(20),
                                      //     height: 31,
                                      //     width: 31,
                                      // color: Colors.red,
                                      // child:
                                      Image(
                                        width: 70,
                                        height: 70,
                                        image: NetworkImage(
                                          'https://${taskdata!.forecast!.forecastday![0].hour![index].condition!.icon}',
                                        ),
                                      ),
                                      //  ),
                                      // SizedBox(
                                      //   height: 1,
                                      // ),
                                      Text(taskdata!.forecast!.forecastday![0]
                                          .astro!.sunrise
                                          // .hour![index].time
                                          .toString()),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                          taskdata!.forecast!.forecastday![0]
                                              .hour![index].tempC
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ))
                                    ]);
                                    // Image.network("https://" +
                                    //     taskdata
                                    //         .forecast!
                                    //         .forecastday![index]
                                    //         .hour![index]
                                    //         .condition!
                                    //         .icon
                                    //         .toString())
                                    // .current!.condition!.icon
                                    // .toString()),

                                    //forecast.forecastday[0].hour[0].condition.icon
                                    //);
                                  }),
                            )
                          ]))
                    ])));
    //);
    // )

    //  Text(taskdata.current!.gustKph.toString()));
  }
}

    //return Container();
 // }
//}