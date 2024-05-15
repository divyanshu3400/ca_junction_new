class User {
  final int id;
  final String password;
  final DateTime? lastLogin;
  final bool isSuperuser;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final String? gstNumber;
  final DateTime? dob;
  final String? phoneNumber;
  final bool isAccepted;
  final String role;

  User({
    required this.id,
    required this.password,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.isAccepted,
    required this.role,
    this.lastLogin,
    this.gstNumber,
    this.dob,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      isSuperuser: json['is_superuser'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
      dateJoined: DateTime.parse(json['date_joined']),
      gstNumber: json['gst_number'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      phoneNumber: json['phone_number'],
      isAccepted: json['is_accepted'],
      role: json['role'],
    );
  }
}
