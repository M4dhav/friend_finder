var locas = [
  [
    [28.448631225781057, 77.58268354008737],
    [28.449084838996665, 77.58454125544061],
  ],
  [
    [28.449499133610818, 77.58360735192923],
    [28.44923040215414, 77.58402760850936],
  ]
];

bool isCoordinateInsideRectangle(double lat1, double lon1, double lat2,
    double lon2, double targetLat, double targetLon) {
  if ((lat1 <= targetLat && targetLat <= lat2 ||
          lat2 <= targetLat && targetLat <= lat1) &&
      (lon1 <= targetLon && targetLon <= lon2 ||
          lon2 <= targetLon && targetLon <= lon1)) {
    return true;
  } else {
    return false;
  }
}

void main() {
  for (var i in locas) {
    print(isCoordinateInsideRectangle(
        i[0][0], i[0][1], i[1][0], i[1][1], 28.4490909, 77.5835954));
  }
}
