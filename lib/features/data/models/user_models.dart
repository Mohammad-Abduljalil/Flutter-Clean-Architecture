import 'package:clean_architicture/core/databases/api/end_points.dart';
import 'package:clean_architicture/features/data/models/sub_models/address_model.dart';
import 'package:clean_architicture/features/data/models/sub_models/company_model.dart';
import 'package:clean_architicture/features/domain/entities/sub_entities/address_entity.dart';
import 'package:clean_architicture/features/domain/entities/user_entity.dart';

class UserModels extends UserEntity{
  final String id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModels({required this.id,
    required this.username,
    required this.website,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.company,
  });

  factory UserModels.fromJson(Map<String,dynamic> json){
   return UserModels(
     id: json[ApiKeys.id],
     username: json[ApiKeys.username],
     website: json[ApiKeys.website],
     name: json[ApiKeys.name],
     phone: json[ApiKeys.phone],
     email: json[ApiKeys.email],
     address: AddressModel.fromJson(json[ApiKeys.address]),
     company: CompanyModel.fromJson(json[ApiKeys.company])
   );
  }

  Map<String ,dynamic> toJson(){
    return{
      ApiKeys.id:id,
      ApiKeys.name:name,
      ApiKeys.username:username,
      ApiKeys.website:website,
      ApiKeys.phone:phone,
      ApiKeys.email:email,
      ApiKeys.address:address,
      ApiKeys.company:company,
    };
  }



}