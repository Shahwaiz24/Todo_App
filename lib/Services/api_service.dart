import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/Model/api_model.dart';
import 'package:todo_app/Screens/home_page.dart';

final Api = 'https://crudcrud.com/api/578854813af64673af3cafe5e073baca';
final baseapi =
    'https://crudcrud.com/api/787b62049e7a454fab2bb35101502f03/unicorns';

class ApiService {
  static PostMethod({required task}) async {
    final body = task;
    final api = '$Api/unicorns';
    final uri = Uri.parse(api);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      issnackbar = true;
    }
  }

  static Future<List<TaskModel>> getdata() async {
    final api = '$Api/unicorns';
    final uri = Uri.parse(api);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      if (responsebody.length == tasks.length) {
        print(tasks.length);
      } else {
        for (var taskJson in responsebody) {
          tasks.add(TaskModel.fromJson(taskJson));
        }
      }

      return tasks;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static deltemethod(String id) async {
    final api = '$Api/unicorns/$id';
    final uri = Uri.parse(api);
    final response = await http.delete(
      uri,
    );
  }
}

List<TaskModel> tasks = [];
