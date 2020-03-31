import 'package:flutter/material.dart';
import 'package:flutter_bloc_provider/changeNotifierProvider/model/goodBye.dart';
import 'package:flutter_bloc_provider/changeNotifierProvider/widgets/mybutton.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoodBye>(
      create: (context) => GoodBye(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc Provider",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("Bloc Provider"),),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<GoodBye>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return MyButton();
                  },
                )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<GoodBye>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
