
import 'package:flutter/foundation.dart';


class GlobalState with ChangeNotifier {
  List<int> counters = [0]; // Initialize with one counter

  void addCounter() {
    counters.add(0);
    notifyListeners(); // Notify listeners (widgets) about the change
  }

  void removeCounter(int index) {
    if (counters.isNotEmpty) {
      counters.removeAt(index);
      notifyListeners();
    }
  }

  void incrementCounter(int index) {
    if (index >= 0 && index < counters.length) {
      counters[index]++;
      notifyListeners();
    }
  }

  void decrementCounter(int index) {
    if (index >= 0 && index < counters.length && counters[index] > 0) {
      counters[index]--;
      notifyListeners();
    }
  }
}
