class Location {
  final int? id;
  final String username;
  final String password;
  Location({this.id, required this.username, required this.password});
  factory Location.fromJason(Map<String, dynamic> json) {
    return Location(
        id: json['id'], username: json['username'], password: json['password']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': username,
    };
  }
}
