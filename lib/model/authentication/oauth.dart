import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:binary_mobile_app/model/authentication/user.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../app_constants.dart';


class OAuthentication {

  static OAuthentication _instance;

  OAuthentication._();

  static OAuthentication get instance {
    if (_instance == null) {
      _instance = OAuthentication._();
    }
    return _instance;
  }


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Stream<String>> _server() async {
    final StreamController<String> onCode = new StreamController();
    HttpServer server =
    await HttpServer.bind('localhost', 8080);
    server.listen((HttpRequest request) async {
      final String token = request.uri.queryParameters["token2"];

      User user = parseUserAccounts (request.uri);

      userInfo.complete(user);

      request.response
        ..statusCode = 200
        ..headers.set("Content-Type", ContentType.HTML.mimeType)
        ..write("<html><center><font size=\"8\">Logged in successfully! <br> <a href=\"bat://binary.app\">Open App Trader</a></font></center></html>");
      await request.response.close();
      await server.close(force: true);
      onCode.add(token);
      await onCode.close();
    });
    return onCode.stream;
  }

  User parseUserAccounts(Uri uri) {
    var user = User();

    int accountIndex = 1;

    while (uri.queryParameters['acct$accountIndex'] != null) {
      user.addAccount(Account(
          id: uri.queryParameters['acct$accountIndex'],
          token: uri.queryParameters['token$accountIndex'],
          currency: uri.queryParameters['cur$accountIndex']
      ));
      accountIndex++;
    }

    return user;
  }


  Completer userInfo = Completer<User>();


  Future<User> getToken() async {
    Stream<String> onCode = await _server();
    String url =
        "https://oauth.binary.com/oauth2/authorize?app_id=$APP_ID";
    _launchURL(url);

    return userInfo.future;
  }
}


class Token {
  final String access;
  final String type;
  final num expiresIn;

  Token(this.access, this.type, this.expiresIn);

  Token.fromMap(Map<String, dynamic> json)
      : access = json['access_token'],
        type = json['token_type'],
        expiresIn = json['expires_in'];
}

class Id {
  final String id;

  Id(this.id);
}

class Cover {
  final String id;
  final int offsetY;
  final String source;

  Cover(this.id, this.offsetY, this.source);

  Cover.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        offsetY = json['offset_y'],
        source = json['source'];
}

class PublicProfile extends Id {
  final Cover cover;
  final String name;

  PublicProfile.fromMap(Map<String, dynamic> json)
      : cover =
  json.containsKey('cover') ? new Cover.fromMap(json['cover']) : null,
        name = json['name'],
        super(json['id']);
}

class FacebookGraph {
  final String _baseGraphUrl = "https://graph.facebook.com/v2.8/";
  final Token token;

  FacebookGraph(this.token);

  Future<PublicProfile> me(List<String> fields) async {
    String _fields = fields.join(",");
    final http.Response response = await http
        .get("$_baseGraphUrl/me?fields=$_fields&access_token=${token.access}");
    return new PublicProfile.fromMap(jsonDecode(response.body));
  }
}