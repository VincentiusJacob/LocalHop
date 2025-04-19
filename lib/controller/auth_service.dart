import 'dart:convert';
import 'package:flutter/services.dart'; 

import 'dart:io';

import 'package:flutter_app_demo/model/user_model.dart';

class AuthService {
  List<UserModel> _users = [];

  Future<File> _getLocalFile() async {
    return File('lib/data/dummy_user.json');
  }

  Future<void> loadUsers() async {
    final File file = await _getLocalFile();

    if (await file.exists()) {
      final contents = await file.readAsString();
      final data = json.decode(contents);
      final usersFromJson = data['users'] as List;
      _users = usersFromJson.map((json) => UserModel.fromJson(json)).toList();
    } else {
      final assetData = await rootBundle.loadString('lib/data/dummy_user.json');
      final data = json.decode(assetData);
      final usersFromJson = data['users'] as List;
      _users = usersFromJson.map((json) => UserModel.fromJson(json)).toList();

      // simpan ke file lokal untuk pertama kali
      await saveUsersToFile();
    }
  }



  // panggil buat register
  Future<bool> register(String name, String email, String password) async {
    await loadUsers();

    

    for (var u in _users) {
      if (u.email == email) {
        return false; 
      }
    }

    _users.add(UserModel.createNewUser(email: email, name: name, password: password));

    await saveUsersToFile();
    
    return true;
  }

  Future<void> saveUsersToFile() async {
    final File file = await _getLocalFile();
    final data = {'users': _users.map((user) => user.toJson()).toList()};
    await file.writeAsString(json.encode(data));

    return;
  }

  // buat login
  Future<bool> login(String email , String password) async {
    await loadUsers();

    for (var u in _users) {
      if (u.email == email && u.password == password) {
        return true;
      }
    }
    return false; 
  }
}
