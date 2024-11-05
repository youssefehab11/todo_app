class UserDM {
  static String collectionName = 'users';
  String? userId;
  String? fullName;
  String? email;

  UserDM({
    required this.userId,
    required this.fullName,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userId': userId,
      if (fullName != null) 'fullName': fullName,
      if (email != null) 'email': email,
    };
  }

  UserDM.fromJson(Map<String, dynamic>? json)
      : this(
          email: json?['userId'],
          fullName: json?['fullName'],
          userId: json?['email'],
        );
}
