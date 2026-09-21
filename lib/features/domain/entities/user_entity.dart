import 'package:clean_architicture/features/domain/entities/sub_entities/address_entity.dart';

class UserEntity{
  final String name;
  final String phone;
  final String email;
  final AddressEntity address;

  UserEntity(this.name, this.phone, this.email, this.address);
}
