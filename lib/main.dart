import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        //backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text(
            "ListView",
          ),
          centerTitle: true,
        ),
        body: BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }

  Widget _myListView() {
    int messageIndex = 0;
    int headerIndex = 0;
    final List<ListItem> items = List<ListItem>.generate(10000, (i) {
      if (i % 6 == 0) {
        return HeadingItem('Heading ${++headerIndex}');
      } else {
        return MessageItem(
            'Sender ${++messageIndex}', 'Message body $messageIndex');
      }
    });

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline6,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
            leading: Icon(Icons.insert_photo),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        }
        return Container();
      },
    );
  }
}

abstract class ListItem {}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}

class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}
