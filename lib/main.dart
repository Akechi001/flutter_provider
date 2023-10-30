import 'package:flutter/material.dart';
import 'package:globalstate/globalstate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  GlobalState globalState = GlobalState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                globalState.addCounter();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (globalState.counters.length > 1) {
                setState(() {
                  globalState.removeCounter();
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: globalState.counters.length,
        itemBuilder: (context, index) {
          return Counter(
            index: index,
            globalState: globalState,
            onRemove: () {
              setState(() {
                globalState.removeCounterAtIndex(index);
              });
            },
          );
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final int index;
  final GlobalState globalState;
  final VoidCallback onRemove;

  Counter({required this.index, required this.globalState, required this.onRemove});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Nilai Counter ${widget.index}:',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          '${widget.globalState.counters[widget.index]}',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                widget.globalState.incrementCounter(widget.index);
                setState(() {});
              },
              child: Icon(Icons.add),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                widget.globalState.decrementCounter(widget.index);
                setState(() {});
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: widget.onRemove,
          child: Text('Hapus Counter'),
        ),
      ],
    );
  }
}