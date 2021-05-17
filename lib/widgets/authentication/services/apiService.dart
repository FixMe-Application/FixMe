import 'dart:async';
import 'dart:convert';
import 'package:fix_me_app/widgets/authentication/models/registerModel.dart';
import 'package:http/http.dart' as http;

Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}
