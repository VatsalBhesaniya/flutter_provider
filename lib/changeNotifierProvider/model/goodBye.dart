import 'package:flutter/cupertino.dart';

class GoodBye with ChangeNotifier {
  String someValue = 'Hello';

  void sayGoodBye(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}
