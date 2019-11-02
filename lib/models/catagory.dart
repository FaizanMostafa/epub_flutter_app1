class Catagory {
  static const NAME_KEY = 'name';
  String id;
  String name;

  Catagory() {
    name = 'motherboard';
  }

  Catagory.fromFirebase(Map<String, dynamic> json){
    name = json[NAME_KEY];
  }
}