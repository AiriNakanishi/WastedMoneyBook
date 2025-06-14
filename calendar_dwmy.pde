/*カレンダー表示のための計算*/
/* 参考元 : https://uraway.hatenablog.com/entry/2016/05/20/224509 */

int weekOfMonth(int year, int month, int date) {//何週目か調べる
  return (date - dayOfWeek(year, month, date) + 12) / 7;
}

int daysSum(int year, int month, int date) {//2000年１月１日からの日付の合計
  // 2000,1,1
  int daysSum = 1;
  for (int y = year-1; y >= 2000; y--) {
    if (isLeapYear(y)) {
      daysSum += 366;
    } else {
      daysSum += 365;
    }
  }

  for (int m = month-1; m >= 1; m--) {
    daysSum += daysOfMonth(year, m);
  }

  daysSum += date;
  return daysSum+5;
}

int dayOfWeek(int year, int month, int date) {//何曜日か調べる
  int daysSum = daysSum(year, month, date);
  // 0 - Sun / 6 - Sat
  return daysSum % 7;
}

boolean isLeapYear(int year) {//閏年を調べる
  if (year % 4 == 0 && year % 100 != 0) {
    return true;
  } else {
    return false;
  }
}

// 4,6,9,11 has 30 days.
int daysOfMonth(int year, int month) {//その月の日付を調べる
  if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  } else if (month == 2) {
    if (isLeapYear(year)) {
      return 29;
    } else {
      return 28;
    }
  } else {
    return 31;
  }
}
