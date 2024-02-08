class LocationResultEntity {
  final double latitude;
  final double longitude;
  final String locality;
  final String subAdministrativeArea;
  final String administrativeArea;
  final String country;

  LocationResultEntity({
    required this.latitude,
    required this.longitude,
    required this.locality,
    required this.subAdministrativeArea,
    required this.administrativeArea,
    required this.country,
  });

  factory LocationResultEntity.initial() => LocationResultEntity(
        latitude: 0,
        longitude: 0,
        locality: '',
        subAdministrativeArea: '',
        administrativeArea: '',
        country: '',
      );

  LocationResultEntity copyWith({
    double? latitude,
    double? longitude,
    String? locality,
    String? subAdministrativeArea,
    String? administrativeArea,
    String? country,
  }) {
    return LocationResultEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locality: locality ?? this.locality,
      subAdministrativeArea:
          subAdministrativeArea ?? this.subAdministrativeArea,
      administrativeArea: administrativeArea ?? this.administrativeArea,
      country: country ?? this.country,
    );
  }

  @override
  String toString() {
    return 'LocationResultEntity(latitude: $latitude, longitude: $longitude, locality: $locality, subAdministrativeArea: $subAdministrativeArea, administrativeArea: $administrativeArea, country: $country)';
  }
}
