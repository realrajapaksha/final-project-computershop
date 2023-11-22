class EmployeeApprovalModel {
  final String userId;
  final String fullName;
  final String tele1;
  final String status;
  final String image;

  const EmployeeApprovalModel(
      {required this.userId,
      required this.fullName,
      required this.tele1,
      required this.status,
      required this.image});

  Map<String, dynamic> toUpdateFireStore() {
    return {
      "status": status,
    };
  }
}
