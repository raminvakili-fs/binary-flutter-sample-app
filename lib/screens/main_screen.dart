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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainScreenViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Binary.com'),
        ),
        body: Content(),
      ),
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
    var mainViewModel = Provider.of<MainScreenViewModel>(context);
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: (mainViewModel.activeSymbols != null) ?
                    Text('Active Symbols ${mainViewModel.activeSymbols.activeSymbols[0].market}') :
                    Text('Active Symbols'),
            onPressed: () {
              mainViewModel.getActiveSymbols(ActiveSymbolsRequest(reqId: 1, activeSymbols: "brief", productType: "basic"));
            },
          ),
          RaisedButton(
            child: Text('authorize'),
            onPressed: () {
            },
          ),
          RaisedButton(
            child: StreamBuilder(
                stream: mainViewModel.tickStream,
                builder: (context, snapshot) {
                  print("View Side ${snapshot.hasData}");
                  if (snapshot.hasData) {
                    var tickStream = snapshot.data as TickStreamResponse;
                    return Text('tick stream ${tickStream.tick.bid}');
                  }
                  return Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  );
                }),
            onPressed: () {
              mainViewModel.getTickStream(ticks: "R_50", subscribe: 1);
            },
          ),
        ],
      ),
    );
  }

}
