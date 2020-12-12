class AccountPost {
  final String id = "D0000000";
  final String name;
  final String department;
  final int grade;
  final String sex;

  AccountPost({this.name, this.department, this.grade, this.sex});

  factory AccountPost.fromJson(Map<String, dynamic> json) {
    return AccountPost(
      name: json['name'] as String,
      department: json['department'] as String,
      grade: json['grade'] as int,
      sex: json['sex'] as String,
    );
  }
}
