import 'dart:convert';

import 'package:clean_architicture/core/databases/api/end_points.dart';

class CompanyModel{
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({required this.name,required this.catchPhrase,required this.bs});

  factory CompanyModel.fromJson(Map<String ,dynamic> json){
    return CompanyModel(
    name: json[ApiKeys.nameOfCompany],
    catchPhrase: json[ApiKeys.catchPhrase],
    bs:json[ApiKeys.bs]
    );
  }

  Map<String,dynamic> toJson(){
  return{
      ApiKeys.nameOfCompany:name,
    ApiKeys.catchPhrase:catchPhrase,
    ApiKeys.bs:bs,
    };
  }

}