import 'dart:convert';
import 'dart:io';

import '../models/user.dart';
import '../services/user_service.dart';

class UserController {
  Future<List<User>> fetchAllUser() async {
    return await UserService().fetch().then((res) {
      if (res.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(res.body);
        return List.generate(
          jsonData.length,
          (index) => User.fromMap(
            jsonData[index],
          ),
        );
      } else {
        throw Exception();
      }
    });
  }
}
