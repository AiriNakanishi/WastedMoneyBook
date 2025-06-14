void drawCalendar(int year, int month) {//カレンダーの表示
  fill(0);
  textSize(50);
  text(year, width/2-100, 70);//年の表示
  text(month, width/2+50, 70);//月の表示

  int dataOfMonth[]=new int[32];//入力金額のデータ
  
  for (int i=0; i<genjou.length; i++) {
    
    String line=genjou[i];
    String[]dataString=line.split(",");//年月日のデータと金額のデータを分ける
    String[]dateString=dataString[0].split("/");//年月日のデータを３つに分ける
    
    if (Integer.parseInt(dateString[0])==year&&Integer.parseInt(dateString[1])==month) {
      
      dataOfMonth[Integer.parseInt(dateString[2])]=Integer.parseInt(dataString[1]);
      
    }
    
  }

  textSize(10);
  int days = daysOfMonth(year, month);

  // draw days of the Month
  for (int day = 1; day <= days; day++) {
    fill(50);

    int x = dayOfWeek(year, month, day);

    int y = weekOfMonth(year, month, day);

    fill(255, 255, 255, 200);
    stroke(0);
    strokeWeight(1);
    rect(x*60+30, y*80+40, 60, 80);//カレンダーの枠

    fill(#E81ED1);
    textSize(14);
    text(dataOfMonth[day], x*60+38, y*80+80);//カレンダーに金額を入力

    int button2=0;
    if (scene==0&&delaycounter==0) {
      if (mouseX>x*60+30 && mouseX<x*60+90 && mouseY>y*80+40 && mouseY<y*80+120) {//カレンダーの枠にカーソルがある時
        if (button2==0&&mousePressed == true) {//button2=0（一回だけ実行）かつクリックされたとき
          button2=1;
          //println("Yes"+day);
          scene=1;
          selectedDay=day;
          delaycounter=30;
        }
        //println("day="+day);
      }
    }


    color z = setColor(x);//日付の色
    fill(z);//日付の色
    textSize(13);
    text(day, x*60+37, y*80+58);//カレンダーの日付の表示
  }

  for (int n=0; n<7; n++) {//曜日の表示
    if (n==0) {//日曜日の色
      fill(#FF0000);
    } else if (n==6) {//土曜日の色
      fill(#0008FF);
    } else {//その他の色
      fill(0);
    }
    textSize(13);
    text(d[n], n*60+49, 118);//曜日の表示
  }

  if (rightButtonOver) {//右のボタンの色を変える
    fill(currentColor);
  } else {
    fill(255);
  }

  stroke(#FC4AE8);
  rect(rectRX, rectRY, rectSize, rectSize);//右のボタンの枠

  fill(#FC4AE8);
  textSize(16);
  text("→", rectRX+3, rectRY+16);//右のボタンに→を表示する

  if (leftButtonOver) {//左のボタンの色を変える
    fill(currentColor);
  } else {
    fill(255);
  }

  stroke(#FC4AE8);
  rect(rectLX, rectLY, rectSize, rectSize);//左のボタンの枠

  fill(#FC4AE8);
  textSize(16);
  text("←", rectLX+3, rectLY+16);//左のボタンに←を表示する

  todayDate();//今日の日付の枠の色を変える

  textSize(10);
}

color setColor(int day) {//日付の色
  if (day == 0) {//日曜日の色
    return #FF0000;
  } else if (day == 6) {//土曜日の色
    return #0008FF;
  } else {
    return #000000;//それ以外
  }
}
