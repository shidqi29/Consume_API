import 'package:http/http.dart' as http;
import '../utils/endpoint.dart';
import '../utils/request_helper.dart';

class AlbumService {
  Future<http.Response> fetchAlbum() async {
    String endPoint = EndPoint.album;
    Uri url = Uri.parse(endPoint);
    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }
}
