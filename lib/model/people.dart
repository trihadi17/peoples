class PeopleModel {
  late String id, email, fullname, job;

  //* Constructor
  PeopleModel({
    required this.id,
    required this.email,
    required this.fullname,
    required this.job,
  });

  PeopleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'fullname': fullname,
        'job': job,
      };
}
