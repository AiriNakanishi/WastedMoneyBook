void todayDate() {//今日のカレンダーの枠の色を変える
  int Y = year();
  int M = month();
  int D = day();

  int todaysX = todaydayOfweek(Y, M, D);//今日がカレンダーの枠の左から何番目か
  int todaysY = todayweekOfMonth(Y, M, D);//今日がカレンダーの枠の上から何番目か

  if (defaultYear==year()&&defaultMonth==month()) {//表示されてるカレンダーが今年で今月のとき
    noFill();
    strokeWeight(5);
    stroke(#FC4AE8);
    rect(todaysX * 60 + 33, todaysY * 80 + 43, 54, 74);//今日のカレンダーの枠
    strokeWeight(1);
  }
}

int todaydayOfweek(int todayyear, int todaymonth, int todaydate) {//今日の曜日
  int todaysSum = daysSum(todayyear, todaymonth, todaydate);
  return todaysSum % 7;
}

int todayweekOfMonth(int todayyear, int todaymonth, int todaydate) {//今日が何週目か
  return((todaydate - todaydayOfweek(todayyear, todaymonth, todaydate) + 12) / 7);
}
