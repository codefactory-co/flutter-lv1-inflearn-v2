void main() {
  basics();
  utc();
  now();
  comparison();
  toUtcToLocal();
}

void basics() {
  final date = DateTime(

      /// 년
      1992,

      /// 월
      11,

      /// 일
      23,

      /// 시
      1,

      /// 분
      23,

      /// 초
      25,

      /// 밀리 초
      30,

      /// 마이크로 초
      5);
}

void utc() {
  final date = DateTime.utc(

      /// 년
      1992,

      /// 월
      11,

      /// 일
      23,

      /// 시
      1,

      /// 분
      23,

      /// 초
      25,

      /// 밀리 초
      30,

      /// 마이크로 초
      5);
}

void now() {
  final now = DateTime.now();

  /// 현재 날짜와 시간이 출력됨
  print(now);
}

void duration() {
  final duration = Duration(
    /// 날
    days: 1,

    /// 시
    hours: 1,

    /// 분
    minutes: 1,

    /// 초
    seconds: 1,

    /// 밀리 초
    milliseconds: 1,

    /// 마이크로 초
    microseconds: 1,
  );
}

void dateCalc() {
  final date = DateTime(
    1992,
    11,
    23,
  );

  final duration = Duration(
    days: 1,
  );

  print(date.add(duration));
  print(date.subtract(duration));
}

void comparison(){
  final date1 = DateTime(
    1992,
    11,
    23,
  );

  final date2 = DateTime(
    2023,
    11,
    23
  );

  print(date1.isAfter(date2));
  print(date1.isBefore(date2));
  print(date1.isAtSameMomentAs(date2));
}

void toUtcToLocal(){
  final date = DateTime(
    1992,
    11,
    23
  );

  final utcDate = date.toUtc();

  print(date);
  print(utcDate);
  print(utcDate.toLocal());
}