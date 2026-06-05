class ParkResponse {
  final List<ParkModel> data;

  ParkResponse({
    required this.data,
  });

  factory ParkResponse.fromJson(Map<String, dynamic> json) {
    return ParkResponse(
      data: (json['data'] as List)
          .map((parkJson) => ParkModel.fromJson(parkJson))
          .toList(),
    );
  }
}

class ParkModel {
  final String id;
  final String fullName;
  final String states;
  final String designation;
  final List<ParkImageModel> images;

  final String? description;
  final String? latitude;
  final String? longitude;
  final List<Activity>? activities;
  final String? directionsInfo;
  final String? weatherInfo;
  final List<OperatingHour>? operatingHours;
  final List<EntranceFee>? entranceFees;

  ParkModel({
    required this.id,
    required this.fullName,
    required this.states,
    required this.designation,
    required this.images,
    this.description,
    this.latitude,
    this.longitude,
    this.activities,
    this.directionsInfo,
    this.weatherInfo,
    this.operatingHours,
    this.entranceFees,
  });

  factory ParkModel.fromJson(Map<String, dynamic> json) {
    return ParkModel(
      id: json['id'],
      fullName: json['fullName'],
      states: json['states'],
      designation: json['designation'],
      images: (json['images'] as List)
          .map((imageJson) => ParkImageModel.fromJson(imageJson))
          .toList(),
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      activities: (json['activities'] as List?)
          ?.map((activityJson) => Activity.fromJson(activityJson))
          .toList(),
      directionsInfo: json['directionsInfo'],
      weatherInfo: json['weatherInfo'],
      operatingHours: (json['operatingHours'] as List?)
          ?.map((hourJson) => OperatingHour.fromJson(hourJson))
          .toList(),
      entranceFees: (json['entranceFees'] as List?)
          ?.map((feeJson) => EntranceFee.fromJson(feeJson))
          .toList(),
    );
  }
}

class ParkImageModel {
  final String url;
  final String alt;

  ParkImageModel({
    required this.url,
    required this.alt,
  });

  factory ParkImageModel.fromJson(Map<String, dynamic> json) {
    return ParkImageModel(
      url: json['url'],
      alt: json['altText'],
    );
  }
}

class Activity {
  final String id;
  final String name;

  Activity({
    required this.id,
    required this.name,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      name: json['name'],
    );
  }
}

class OperatingHour {
  final String description;

  OperatingHour({
    required this.description,
  });

  factory OperatingHour.fromJson(Map<String, dynamic> json) {
    return OperatingHour(
      description: json['description'],
    );
  }
}

class EntranceFee {
  final String cost;
  final String title;

  EntranceFee({
    required this.cost,
    required this.title,
  });

  factory EntranceFee.fromJson(Map<String, dynamic> json) {
    return EntranceFee(
      cost: json['cost'],
      title: json['title'],
    );
  }
}