library globalstate;
import 'package:flutter/foundation.dart';


class GlobalState {
  List<int> counters = [0];

  void incrementCounter(int index) {
    counters[index]++;
  }

  void decrementCounter(int index) {
    if (counters[index] > 0) {
      counters[index]--;
    }
  }

  void addCounter() {
    counters.add(0);
  }

  void removeCounter() {
    if (counters.length > 1) {
      counters.removeLast();
    }
  }

  void removeCounterAtIndex(int index) {
    if (index >= 0 && index < counters.length) {
      counters.removeAt(index);
    }
  }

  void reorderCounters(int oldIndex, int newIndex) {
    if (oldIndex >= 0 && oldIndex < counters.length && newIndex >= 0 && newIndex < counters.length) {
      final counter = counters.removeAt(oldIndex);
      counters.insert(newIndex, counter);
    }
  }

  static final GlobalState _instance = GlobalState._internal();

  factory GlobalState() => _instance;

  GlobalState._internal();
}