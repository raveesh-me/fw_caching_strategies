import 'package:flutter/material.dart';

enum ActiveTimerState { playing, paused, stopped }

class ActiveTimer {
  ActiveTimerState activeTimerState;
  final DateTime startTime;
  final Duration duration;
  final List<PlayPauseEvent> playPauseEvents;

  ActiveTimer({
    required this.startTime,
    required this.duration,
    required this.playPauseEvents,
  }) : activeTimerState = ActiveTimerState.playing;
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
