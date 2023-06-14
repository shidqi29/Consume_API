import 'package:consume_api/utils/request_helper.dart';
import 'package:http/http.dart' as http;

import '../utils/endpoint.dart';

class UserService {
  Future<http.Response> fetch() async {
    String endPoint = EndPoint.user;
    Uri url = Uri.parse(endPoint);
    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }
}
