import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:messenger/models/messenger_model.dart';

class FetchApiProvider {

    Future<List<MessengerModel>> fetchApi()async{

      const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      
      try{
        if(response.statusCode == 200){
        List json = jsonDecode(response.body)['items'] ;
        List <MessengerModel> list =json.map((e) => MessengerModel.fromJson(e)).toList();
        return list;
      }
      }
      catch(e){
        throw Exception(e);
      }
      throw Exception("failed to fetch data");
    }
    }

