class DetailsModel {
  final String eventId;
  final String title;
  final String description;
  final String payout;
  final bool isCompleted;
  final int payoutAmt;
  final String payoutCurrency;

  DetailsModel({
    required this.eventId,
    required this.title,
    required this.description,
    required this.payout,
    required this.isCompleted,
    required this.payoutAmt,
    required this.payoutCurrency,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      eventId: json['eventId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      payout: json['payout'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      payoutAmt: json['payout_amt'] ?? 0,
      payoutCurrency: json['payout_currency'] ?? '',
    );
  }
}
