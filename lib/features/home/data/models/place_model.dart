class Place {
  final String title;
  final dynamic ppm; // CO₂ parts per million
  final int people;
  final int percentChange;
  final int rooms;
  final int area;
  final int ac;
  final int refrigerator;
  final int computers;
  final int indoorPlants;
  final int kitchenBurner;
  final int totalPlants;

  Place({
    required this.title,
    required this.ppm,
    this.people = 0,
    this.percentChange = 0,
    this.rooms = 0,
    this.area = 0,
    this.ac = 0,
    this.refrigerator = 0,
    this.computers = 0,
    this.indoorPlants = 0,
    this.kitchenBurner = 0,
    this.totalPlants = 0,
  });
}
