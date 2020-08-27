import 'dart:async';

import 'package:angular/angular.dart';
import 'package:popping_balloons/src/models/balloon.dart';

@Component(
  selector: 'balloon',
  templateUrl: 'balloon_component.html',
  styleUrls: ['balloon_component.css'],
)
class BalloonComponent implements OnInit, AfterChanges, OnDestroy {
  @Input()
  Balloon balloon;

  @Input()
  int lastPoppedBalloonIndex;

  @Output()
  Stream<Balloon> get onPop => _balloonPopController.stream;

  final StreamController<Balloon> _balloonPopController =
      StreamController.broadcast();

  String src;
  String className = 'move-from-top';
  static const duration1000ms = Duration(milliseconds: 1000);
  static const duration400ms = Duration(milliseconds: 400);

  @override
  void ngOnInit() {
    src = 'assets/img/${balloon.color}_balloon.png';
    Future.delayed(duration1000ms, () {
      className = 'wiggle';
    });
  }

  @override
  void ngAfterChanges() {
    if (lastPoppedBalloonIndex == null) return;

    if (balloon.index > lastPoppedBalloonIndex) {
      className = 'turn-right';
    } else if (balloon.index < lastPoppedBalloonIndex) {
      className = 'turn-left';
    }
    Future.delayed(duration400ms, () {
      className = '';
    });
  }

  void handleClick() async {
    src = 'assets/img/${balloon.color}_balloon_popped.png';
    await Future.delayed(duration400ms);
    _balloonPopController.add(balloon);
  }

  @override
  void ngOnDestroy() {
    print('I\'ll be avenged!');
  }
}
