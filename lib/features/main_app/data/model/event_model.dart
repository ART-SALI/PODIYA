
import 'package:pod_i_ya/core/helper/type_aliases.dart';
import 'package:pod_i_ya/features/main_app/domain/entities/event.dart';

class EventModel extends Event {
  EventModel({super.id,
  super.rating,
  super.name,
  super.description,
  super.price,
  super.image,
  super.location,
  super.time,
  super.created_at,
  super.city,
  super.creator,
  super.tags});

  EventModel.fromJson(Json json) {
    id = json['id'];
    rating = double.parse(json['rating'].toString());
    name = json['name'];
    description = json['description'];
    price = double.parse(json['price'].toString());
    image = json['image'];
    location = json['location_info'];
    time = DateTime.parse(json['time'].toString());
    created_at = DateTime.parse(json['created_at'].toString());
    city = json['city'];
    creator = json['creator'];
    tags = json['tags'];
  }

  Json toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['rating'] = rating;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['location'] = location;
    data['time'] = time;
    data['created_at'] = created_at;
    data['city'] = city;
    data['creator'] = creator;
    data['tags'] = tags;
    return data;
  }


}
