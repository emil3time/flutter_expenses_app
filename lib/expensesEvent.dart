class ExpensesEvent {
  final int id;
  final int price;
  final String name;
  DateTime time = DateTime.now();
  ExpensesEvent(
      {required this.id,
      required this.price,
      required this.name,
      required this.time});
}
