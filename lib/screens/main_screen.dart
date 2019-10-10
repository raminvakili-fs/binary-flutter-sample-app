import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:binary_mobile_app/viewmodels/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary.com'),
      ),
      body: Content(),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('authorize'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
