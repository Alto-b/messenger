import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:messenger/models/messenger_model.dart';

class FetchApiProvider {

    Future<List<MessengerModel>> fetchApi()async{

      const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      print(response.statusCode);
      try{
        if(response.statusCode == 200){
        List json = jsonDecode(response.body)['items'] ;
        List <MessengerModel> list =json.map((e) => MessengerModel.fromJson(e)).toList();
        print("list length : ${list.length}");
        print("response code ${response.statusCode}");
        return list;
      }
      }
      catch(e){
        throw Exception(e);
      }
      throw Exception("failed to fetch data");
    }

      Future<void> postApi(String title, String description)async{
    // print(description);
    final body = {
                "title": title,
                "description": description,
                "is_completed": true
              };
              // print(body);
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json'
      });

    if(response.statusCode==201){
      print("post success");
      print(response.body);
    }
    else{
      print("post failed");
    }
  }
    }

