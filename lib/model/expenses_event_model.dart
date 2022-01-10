class ExpensesEventModel {
  final DateTime id;
  final double price;
  final String name;
  DateTime time = DateTime.now();
  ExpensesEventModel(
      {required this.id,
      required this.price,
      required this.name,
      required this.time});
}
