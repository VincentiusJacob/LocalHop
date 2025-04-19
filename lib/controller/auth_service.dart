import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app_demo/model/user_model.dart';

class AuthService {
  List<UserModel> _users = [];

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/dummy_user.json');
    return file;
  }

  Future<void> loadUsers() async {
    final File file = await _getLocalFile();

    if (await file.exists()) {
      final contents = await file.readAsString();
      final data = json.decode(contents);
      final usersFromJson = data['users'] as List;
      _users = usersFromJson.map((json) => UserModel.fromJson(json)).toList();
    } else {
      // load dari assets hanya pertama kali
      final assetData = await rootBundle.loadString('lib/data/dummy_user.json');
      final data = json.decode(assetData);
      final usersFromJson = data['users'] as List;
      _users = usersFromJson.map((json) => UserModel.fromJson(json)).toList();

      // simpan ke file lokal
      await saveUsersToFile();
    }
  }

  Future<void> saveUsersToFile() async {
    final file = await _getLocalFile();
    final data = {'users': _users.map((user) => user.toJson()).toList()};
    await file.writeAsString(json.encode(data));
  }

  Future<bool> register(String name, String email, String password) async {
    await loadUsers();

    for (var u in _users) {
      if (u.email == email) {
        return false;
      }
    }

    UserModel newUser = UserModel(email: email, name: name, password: password);
    _users.add(newUser);

    await saveUsersToFile();
    return true;
  }

  Future<bool> login(String email, String password) async {
    await loadUsers();

    for (var u in _users) {
      if (u.email == email && u.password == password) {
        return true;
      }
    }
    return false;
  }
}
