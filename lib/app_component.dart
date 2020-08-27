import 'package:angular/angular.dart';
import 'package:popping_balloons/src/models/balloon.dart';
import 'package:popping_balloons/src/components/balloon/balloon_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    NgFor,
    BalloonComponent,
  ],
)
class AppComponent {
  List<Balloon> listOfBalloons = [
    Balloon('yellow', 0),
    Balloon('blue', 1),
    Balloon('green', 2),
    Balloon('red', 3),
    Balloon('yellow', 4),
    Balloon('blue', 5),
  ];

  String headerText = 'Look at my beautiful balloons!';
  List<String> messages = [];
  int lastPoppedBalloonIndex;

  void handleBalloonPop(Balloon balloon) {
    listOfBalloons.remove(balloon);
    messages.add('Why would you ever pop that beautiful ${balloon.color} balloon...');
    lastPoppedBalloonIndex = balloon.index;

    if (listOfBalloons.isEmpty) {
      headerText = 'Thanks to you they all are gone >:|';
    }
  }

}
