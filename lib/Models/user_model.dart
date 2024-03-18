class UserModel {
  UserModel({
    this.id,
    this.phone,
    this.fullName,
    this.password,
    this.email,
    this.country,
    this.subscriptionStatus,
    this.subscriptionDate,
    this.expirationDate,
    this.secQ1A,
    this.secQ2A,
    this.creationTime,
    this.lastModificationTime,
    this.student,
  });

  String? id;
  String? phone;
  String? fullName;
  String? password;
  String? email;
  String? country;
  String? subscriptionStatus;
  String? subscriptionDate;
  String? expirationDate;
  String? secQ1A;
  String? secQ2A;
  String? creationTime;
  String? lastModificationTime;
  bool? student;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    fullName = json['fullName'];
    password = json['password'];
    email = json['email'];
    country = json['country'];
    subscriptionStatus = json['subscriptionStatus'];
    subscriptionDate = json['subscriptionDate'];
    expirationDate = json['expirationDate'];
    secQ1A = json['secQ1A'];
    secQ2A = json['secQ2A'];
    creationTime = json['creationTime'];
    lastModificationTime = json['lastModificationTime'];
    student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['fullName'] = fullName;
    data['password'] = password;
    data['email'] = email;
    data['country'] = country;
    data['subscriptionStatus'] = subscriptionStatus;
    data['subscriptionDate'] = subscriptionDate;
    data['expirationDate'] = expirationDate;
    data['secQ1A'] = secQ1A;
    data['secQ2A'] = secQ2A;
    data['creationTime'] = creationTime;
    data['lastModificationTime'] = lastModificationTime;
    data['student'] = student;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    return {
      'phone' : phone,
      'fullName' : fullName,
      'password' : password,
      'email' : email,
      'country' : country,
      'secQ1A' : secQ1A,
      'secQ2A' : secQ2A,
      'student' : student,
    };
  }


}
