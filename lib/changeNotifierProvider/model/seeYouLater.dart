import 'package:flutter_bloc_provider/changeNotifierProvider/model/goodBye.dart';

class SeeYouLater {
  GoodBye _myModel;

  SeeYouLater(this._myModel);

  void saySeeYouLater() {
    _myModel.sayGoodBye('See you later');
    print('doing something else');
  }
}
