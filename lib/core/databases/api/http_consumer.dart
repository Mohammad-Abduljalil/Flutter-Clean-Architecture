import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_consumer.dart';

class HttpConsumer implements ApiConsumer{
  final http.Client client;
  final String baseUrl;
  HttpConsumer({required this.client,required this.baseUrl});
  @override
  Future get(String path,{Object? data,Map<String,dynamic>? queryParameters})async{
    try{
      final fullUrl=baseUrl + path;
      final uri=Uri.parse(fullUrl).replace(queryParameters: queryParameters);
      final response=await  client.get(uri);
      return _handleResponse(response);
    }on Exception{
      rethrow;
    }
  }

  @override
  Future post(String path,{Object? data,Map<String,dynamic>? queryParameters,bool isFormData=false})async{
    try{
      final fullUrl=baseUrl + path;
      final uri=Uri.parse(fullUrl).replace(queryParameters: queryParameters);
      http.Response response;
      if(isFormData){
        var request=http.MultipartRequest('POST',uri);
        if(data is Map<String,String>){
          request.fields.addAll(data);
        }
        var streamResponse=await request.send();
        response=await http.Response.fromStream(streamResponse);
      }else{
        response =await client.post(
            uri,
            body: jsonEncode(data),
            headers: {'Content-Type':'application/json'}
        );
      }
      return _handleResponse(response);
    }on Exception{
      rethrow;
    }
  }

  @override
  Future patch(String path,{Object? data,Map<String,dynamic>? queryParameters,bool isFormData=false})async{
    try{
      final fullUrl=baseUrl + path;
      final uri=Uri.parse(fullUrl).replace(queryParameters: queryParameters);
      http.Response response;
      if(isFormData){
        var request=http.MultipartRequest('PATCH',uri);
        if(data is Map<String,String>){
          request.fields.addAll(data);
        }
        var streamResponse=await request.send();
        response=await http.Response.fromStream(streamResponse);
      }else{
        response =await client.patch(
            uri,
            body: jsonEncode(data),
            headers: {'Content-Type':'application/json'}
        );
      }
      return _handleResponse(response);
    }on Exception{
      rethrow;
    }
  }

  @override
  Future put(String path,{Object? data,Map<String,dynamic>? queryParameters,bool isFormData=false})async{
    try{
      final fullUrl=baseUrl + path;
      final uri=Uri.parse(fullUrl).replace(queryParameters: queryParameters);
      http.Response response;
      if(isFormData){
        var request=http.MultipartRequest('PUT',uri);
        if(data is Map<String,String>){
          request.fields.addAll(data);
        }
        var streamResponse=await request.send();
        response=await http.Response.fromStream(streamResponse);
      }else{
        response =await client.put(
            uri,
            body: jsonEncode(data),
            headers: {'Content-Type':'application/json'}
        );
      }
      return _handleResponse(response);
    }on Exception{
      rethrow;
    }
  }

  @override
  Future delete(String path,{Object? data,Map<String,dynamic>? queryParameters,bool isFormData=false})async{
    try{
      final fullUrl=baseUrl + path;
      final uri=Uri.parse(fullUrl).replace(queryParameters: queryParameters);
      http.Response response;
      if(isFormData){
        var request=http.MultipartRequest('DELETE',uri);
        if(data is Map<String,String>){
          request.fields.addAll(data);
        }
        var streamResponse=await request.send();
        response=await http.Response.fromStream(streamResponse);
      }else{
        response =await client.delete(
            uri,
            body: jsonEncode(data),
            headers: {'Content-Type':'application/json'}
        );
      }
      return _handleResponse(response);
    }on Exception{
      rethrow;
    }
  }

  dynamic _handleResponse(http.Response response){
    final responseJson=jsonDecode(response.body);
    if(response.statusCode>=200 && response.statusCode<300){
      return responseJson;
    }else{
      throw Exception("Error : ${response.statusCode}");
    }
  }


}