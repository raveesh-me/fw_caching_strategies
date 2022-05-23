import 'package:example/model/active_timer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('active timer', () {
    test('can construct and hold times', () {
      ActiveTimer activeTimer = ActiveTimer(
        startTime: DateTime(2022),
        duration: const Duration(minutes: 2),
      );
      activeTimer.playPauseToggle(DateTime(2022, 1, 1, 0, 0, 70));
      activeTimer.playPauseToggle(DateTime(2022, 1, 1, 0, 0, 95));
      expect(
        activeTimer.remainingDuration,
        const Duration(minutes: 2, seconds: 25),
      );
    });
  });
}
