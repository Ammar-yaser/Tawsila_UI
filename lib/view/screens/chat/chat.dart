import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
// import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate local = LocalizedApp.of(context).delegate;
    String lang = local.currentLocale.languageCode;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Material(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  lang == 'ar' ? 10 : 30,
                  0,
                  lang == 'ar' ? 30 : 10,
                  12,
                ),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Gregory Smith',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                    CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black.withOpacity(0.4)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      children: <Widget>[
                        Bubble(
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                            'Today at 5:03 PM',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.caption,
                          ),
                        ),
                        Bubble(
                          margin: BubbleEdges.only(
                              left: MediaQuery.of(context).size.width * .2,
                              top: 10),
                          padding: BubbleEdges.all(12),
                          alignment: Alignment.topRight,
                          radius: Radius.circular(13),
                          nipWidth: 10,
                          nipHeight: 10,
                          nip: BubbleNip.rightBottom,
                          color: theme.primaryColor,
                          child: Text(
                            'Hello, are you nearby?',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Bubble(
                          margin: BubbleEdges.only(
                              right: MediaQuery.of(context).size.width * .2,
                              top: 10),
                          padding: BubbleEdges.all(12),
                          alignment: Alignment.topLeft,
                          radius: Radius.circular(13),
                          nipWidth: 10,
                          nipHeight: 10,
                          nip: BubbleNip.leftBottom,
                          color: Colors.grey[100],
                          child: Text(
                            'I\'ll be there in a few mins',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ChatTextField()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .75,
          child: Align(
            alignment: Alignment.centerRight,
            child: Card(
              elevation: 6,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  // bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Container(
                  color: Theme.of(context).primaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('My message test test My message test test',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('22:10',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

class OtherMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .75,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Card(
              elevation: 6,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Container(
                // color:
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Other message',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '22:11',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatTextField extends StatefulWidget {
  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  OutlineInputBorder fieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100].withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 25),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: TextField(
                  onChanged: (_) {
                    // _runTimer();
                  },
                  onSubmitted: (_) {
                    // _sendMessage();
                  },
                  // controller: _textEditingController,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Type a message...',
                      enabledBorder: fieldBorder,
                      focusedBorder: fieldBorder,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      filled: true,
                      fillColor: Colors.white),
                  minLines: 1,
                  maxLines: 4,
                  style: TextStyle(height: 1.5),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.send),
                color: Theme.of(context).primaryColor,
                iconSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
