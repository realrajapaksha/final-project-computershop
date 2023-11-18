class ComplainViewModel {
  final String reportId;
  final String pname;
  final String image;
  final String productId;
  final String email;
  final String note;
  final int date;

  const ComplainViewModel(
      {required this.reportId,
      required this.pname,
      required this.image,
      required this.productId,
      required this.email,
      required this.note,
      required this.date});
}
