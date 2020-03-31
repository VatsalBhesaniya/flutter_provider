import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/changeNotifierProvider/model/colorBox.dart';
import 'package:flutter_bloc_provider/changeNotifierProvider/model/goodBye.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //                              <--- MultiProvider
      providers: [
        ChangeNotifierProvider<GoodBye>(
          //               <--- ChangeNotifierProvider
          create: (context) => GoodBye(),
        ),
//        ProxyProvider<GoodBye, SeeYouLater>(
//          //          <--- ProxyProvider
//          update: (context, goodBye, seeYouLater) => SeeYouLater(goodBye),
//        ),
        ChangeNotifierProvider<ColorBox>(
          //               <--- ChangeNotifierProvider
          create: (context) => ColorBox(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc Provider",
        home: Scaffold(
          appBar: AppBar(title: Text("Provider")),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 16.0,
                  ),
                  Consumer<GoodBye>(
                    //            <--- goodBye Consumer
                    builder: (context, goodBye, child) {
                      return Text(goodBye.someValue);
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Consumer<GoodBye>(
                    //          <--- goodBye Consumer
                    builder: (context, goodBye, child) {
                      return RaisedButton(
                        child: Text('Say Goodbye'),
                        onPressed: () {
                          goodBye.sayGoodBye('Goodbye');
                        },
                      );
                    },
                  ),
//                  SizedBox(
//                    height: 16.0,
//                  ),
//                  Consumer<SeeYouLater>(
//                    //          <--- seeYouLater Consumer
//                    builder: (context, seeYouLater, child) {
//                      return RaisedButton(
//                        child: Text('Say see you later'),
//                        onPressed: () {
//                          seeYouLater.saySeeYouLater();
//                        },
//                      );
//                    },
//                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Consumer<ColorBox>(
                    //          <--- seeYouLater Consumer
                    builder: (context, colorBox, child) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            width: 200.0,
                            color: colorBox.color,
                          ),
                          RaisedButton(
                            child: Text('Change box color'),
                            onPressed: () {
                              final Random _random = Random();
                              Color color = Color.fromARGB(
                                _random.nextInt(256),
                                _random.nextInt(256),
                                _random.nextInt(256),
                                _random.nextInt(256),
                              );
                              colorBox.setColor(color);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





