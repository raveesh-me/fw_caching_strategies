import 'dart:developer';

enum ActiveTimerState { playing, paused, stopped }

class ActiveTimer {
  ActiveTimerState activeTimerState;
  final DateTime startTime;
  final Duration duration;
  final List<PlayPauseEvent> playPauseEvents;

  ActiveTimer({
    required this.startTime,
    required this.duration,
  })  : activeTimerState = ActiveTimerState.playing,
        playPauseEvents = <PlayPauseEvent>[];

  Duration get remainingDuration =>
      playPauseEvents.isEmpty ? duration : playPauseEvents.last.newDuration;

  playPauseToggle(DateTime now) {
    PlayPauseEventType toggleType;
    PlayPauseEvent event;
    switch (activeTimerState) {
      case ActiveTimerState.playing:
        toggleType = PlayPauseEventType.pause;
        event = PlayPauseEvent(
          type: toggleType,
          playPauseEventTime: now,
          newDuration: remainingDuration,
        );
        break;
      case ActiveTimerState.paused:
        toggleType = PlayPauseEventType.play;
        event = PlayPauseEvent(
          type: PlayPauseEventType.play,
          playPauseEventTime: now,
          newDuration: remainingDuration +
              now.difference(playPauseEvents.last.playPauseEventTime),
        );
        break;
      case ActiveTimerState.stopped:
        String exceptionMessage =
            "Error: Play/Pause called when the card is stopped";
        log(exceptionMessage);
        throw Exception(exceptionMessage);
    }
        playPauseEvents.add(event);
  }
}

enum PlayPauseEventType { play, pause }

class PlayPauseEvent {
  final PlayPauseEventType type;
  final DateTime playPauseEventTime;
  final Duration newDuration;

  PlayPauseEvent({
    required this.type,
    required this.playPauseEventTime,
    required this.newDuration,
  });
}
