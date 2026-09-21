import 'package:clean_architicture/core/errors/failures.dart';
import 'package:clean_architicture/core/params/user_params.dart';
import 'package:clean_architicture/features/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository{
  Future<Either<Failures,UserEntity>> getUser({required UserParams params});
}