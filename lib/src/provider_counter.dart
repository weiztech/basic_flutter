import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'classes/counter.dart';

class MainCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(
            builder: (BuildContext context) => Counter(0)),
        Provider<Planet>(builder: (BuildContext context) => Planet.mars()),
        /* 
          cannot be updated, the value only can be used for read
          for able to change value, provider value must be an object
        */
        Provider<String>(builder: (BuildContext context) => "Master")
      ],
      child: MainCounterState(),
    );
  }
}

class MainCounterState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    final mars = Provider.of<Planet>(context);
    var hello = Provider.of<String>(context);
    print("$counter $mars $hello");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text("Counter Using Provider"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCounter()} ${mars.showName}',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$hello',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              counter.increment();
              mars.changeNameCounter(counter.getCounter());

              /* 
                cannot be updated, the value only can be used for read
                for able to change value, provider value must be an object
              */
              hello = "Increment";
            },
            tooltip: 'Increase',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              counter.decrement();
              mars.changeNameCounter(counter.getCounter());

              /* 
                cannot be updated, the value only can be used for read
                for able to change value, provider value must be an object
              */
              hello = "Decrement";
            },
            tooltip: 'Decrease',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
