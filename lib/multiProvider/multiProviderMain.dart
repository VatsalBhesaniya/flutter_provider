import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelOne>(
          create: (context) => ModelOne(),
        ),
        ChangeNotifierProvider<ModelTwo>(
          create: (context) => ModelTwo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc Provider",
        home: Scaffold(
          appBar: AppBar(title: Text("Bloc Provider")),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Consumer<ModelOne>(
                    //            <--- MyModel Consumer
                    builder: (context, myModel, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RaisedButton(
                          child: Text('Say GoodBye'),
                          onPressed: () {
                            // We have access to the model.
                            myModel.doSomething();
                          },
                        ),
                      );
                    },
                  ),
                  Consumer<ModelOne>(
                    //              <--- MyModel Consumer
                    builder: (context, myModel, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(myModel.someValue),
                      );
                    },
                  ),
                ],
              ),

              // SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Consumer<ModelTwo>(
                    //      <--- AnotherModel Consumer
                    builder: (context, myModel, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: RaisedButton(
                          child: Text('Generate Random'),
                          onPressed: () {
                            myModel.doSomething();
                          },
                        ),
                      );
                    },
                  ),
                  Consumer<ModelTwo>(
                    //        <--- AnotherModel Consumer
                    builder: (context, anotherModel, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('${anotherModel.someValue}'),
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

class ModelOne with ChangeNotifier {
  String someValue = 'Hello';
  void doSomething() {
    someValue = someValue == 'Hello' ? someValue = 'Goodbye' : someValue = 'Hello';
    print(someValue);
    notifyListeners();
  }
}

class ModelTwo with ChangeNotifier {
  int someValue = 0;
  void doSomething() {
    someValue = math.Random().nextInt(9-0);
    print(someValue);
    notifyListeners();
  }
}