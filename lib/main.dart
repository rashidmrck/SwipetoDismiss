import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = 'Dismissible App';
  final items = List<String>.generate(30, (index) => 'item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item),
                onDismissed: (direction){
                  setState(() {
                    items.removeAt(index);
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item was deleted')));
                  });
                },
                background: Container(
                  color: Colors.grey,
                ),
                child: Card(
                  child: ListTile(
                    title: Text(items[index]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
