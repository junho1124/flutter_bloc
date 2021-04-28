import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}
final counterBloc = CounterBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.count$, // 여기로 흘러들어온 데이터가 snapshot으로 간다.
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('${snapshot.data}',
            style: TextStyle(
              fontSize: 40
            ),);
          } else {
            return CircularProgressIndicator();
          }
        },),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          //TODO _counter++;
          counterBloc.addCounter();
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
