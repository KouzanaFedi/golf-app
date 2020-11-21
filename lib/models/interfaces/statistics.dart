class Statistics {
  final double fairway,
      gir,
      puts,
      ss,
      sandSaves,
      greensInReg,
      puttingAverage,
      drivingAcc;
  Statistics(
      {this.drivingAcc,
      this.fairway,
      this.gir,
      this.greensInReg,
      this.puts,
      this.puttingAverage,
      this.sandSaves,
      this.ss});

  @override
  String toString() {
    return "drivingAcc : $drivingAcc, fairway : $fairway, gir : $gir, greensInReg : $greensInReg, puts : $puts, puttingAverage : $puttingAverage, sandSaves : $sandSaves, ss : $ss .";
  }

  factory Statistics.fromJSON(Map<String, dynamic> json) => Statistics(
        drivingAcc: double.parse(
            double.parse(json["driving_accuracy"]).toStringAsFixed(2)),
        fairway: double.parse(double.parse(json["Fairway"]).toStringAsFixed(2)),
        gir: double.parse(double.parse(json["Gir"]).toStringAsFixed(2)),
        greensInReg: double.parse(
            double.parse(json["greens_in_regulation"]).toStringAsFixed(2)),
        puts: double.parse(double.parse(json["Puts"]).toStringAsFixed(2)),
        puttingAverage: double.parse(
            double.parse(json["putting_average"]).toStringAsFixed(2)),
        sandSaves:
            double.parse(double.parse(json["sandSaves"]).toStringAsFixed(2)),
        ss: double.parse(double.parse(json["SS"]).toStringAsFixed(2)),
      );
}
