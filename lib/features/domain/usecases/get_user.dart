import 'package:clean_architicture/core/errors/failures.dart';
import 'package:clean_architicture/core/params/user_params.dart';
import 'package:clean_architicture/features/domain/entities/user_entity.dart';
import 'package:clean_architicture/features/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUser{
  final UserRepository repository;

  GetUser({required this.repository});
  Future<Either<Failures,UserEntity>> call({required UserParams params}){
    return repository.getUser(params: params);
  }
}