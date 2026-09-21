import 'package:clean_architicture/features/domain/entities/sub_entities/geo_entity.dart';

class AddressEntity{
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  AddressEntity(this.street, this.suite, this.city, this.zipcode, this.geo);
}