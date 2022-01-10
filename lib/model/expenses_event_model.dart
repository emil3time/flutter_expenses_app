class ExpensesEventModel {
  final int id;
  final int price;
  final String name;
  DateTime time = DateTime.now();
  ExpensesEventModel(
      {required this.id,
      required this.price,
      required this.name,
      required this.time});
}
