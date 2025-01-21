class Measurements {
  static final Measurements _singleton = Measurements._internal();

  factory Measurements() => _singleton;

  Measurements._internal();
}
