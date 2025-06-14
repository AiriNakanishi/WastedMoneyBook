void numberkey() {//数字キー自体の表示
  fill(255);
  rect(110, 120, 260, 410);//外側の枠
  rect(120, 140, 240, 100);//入力内容表示の枠
  rect(90, 100, 30, 30);//左上×ボタンの枠

  fill(0);
  textSize(30);
  text("×", 93, 125);//左上×の表示

  for (int count = 0; count < 12; count++) {
    int n = 120 + (count % 3) * 80; // nの計算
    int i = 280 + (count / 3) * 60; // iの計算

    fill(255);
    stroke(0);
    rect(n, i, 80, 60);

    textSize(20);
    fill(0);
    text(s[count], n + 20, i + 40);//数字キーの数字の表示

    if (overNumberButton(n, i, 80, 60)) {//数字キーにカーソルがあるとき
      NumberButtonover=true;
      button = count;
    }
  }
}

void money() {//数字キーの入力と入力内容の表示
  numberCancelOver=false;
  if (numberkey==true&&delaycounter==0) {
    if (button==9) {//削除が押されたとき
      if (kingaku.length()!=0) {//入力された金額が0じゃないとき
        kingaku=kingaku.substring(0, kingaku.length()-1);//一文字ずつ消す
      }
    } else if (button==11&&kingaku.length()!=0) {//決定が押されたとき
      String[]kiroku = {defaultYear+"/"+defaultMonth+"/"+selectedDay+","+kingaku};//kirokuの中に年月日と金額を記録する
      genjou = concat(genjou, kiroku);

      saveStrings("data.txt", genjou);
      button=-1;//buttonを関係ない数字にする
      kingaku="";//入力画面をリセットする
      scene=0;//画面をカレンダーに戻す
      delaycounter=30;//カレンダーに戻してから、0.5秒間反応しないようにする
    } else if (button==0||button==1||button==2||button==3||button==4||button==5||button==6||button==7||button==8||button==10) {
      if (button >= 0 && button < 12) {
        kingaku=kingaku+s[button];//文字列で表示
      }
    }
    numberkey=false;//１回だけ入力
  }
  fill(0);
  textSize(50);
  text(kingaku, 130, 210);//数字キーの入力内容の表示
  textSize(30);
  println(kingaku);

  if (overNumberCancel(90, 100, 30, 30)) {//左上の×にカーソルがあるとき
    numberCancelOver=true;
  }
}
