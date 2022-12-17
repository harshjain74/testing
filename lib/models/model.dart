class Model {
  String name = "unknown";
  String date = "";
  bool isabsent = false;
  int rollno = 0;

  Model.fromjson(Map<String, dynamic> data) {
    name = data['name'] ?? "unknown";
    date = data['date'] ?? "22-10-2022";
    isabsent = data['isabsent'] == 0 ? false : true;
    rollno = data['rollno'] ?? 0;
  }
}
