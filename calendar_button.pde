void update() {
  if (overLeftButton(rectLX, rectLY, rectSize, rectSize)) {//左のボタンにカーソルがある時
    leftButtonOver = true;
    rightButtonOver = false;
  } else if (overRightButton(rectRX, rectRY, rectSize, rectSize)) {//右のボタンにカーソルがある時
    leftButtonOver = false;
    rightButtonOver = true;
  } else {
    leftButtonOver = false;
    rightButtonOver = false;
  }
}

void mousePressed() {
  if (leftButtonOver) {//左のボタンが押されたとき
    background(255);
    BackGround();

    if (defaultMonth == 1) {
      defaultMonth = 12;
      defaultYear -= 1;
    } else {
      defaultMonth -= 1;//月を１つ戻す
    }
  }

  if (rightButtonOver) {//右のボタンが押されたとき
    background(255);
    BackGround();

    if (defaultMonth == 12) {
      defaultMonth = 1;
      defaultYear += 1;
    } else {
      defaultMonth += 1;//月を１つ増やす
    }
  }

  if (NumberButtonover) {//数字キーが押されたとき
    numberkey=true;
  } else {
    numberkey=false;
  }

  if (numberCancelOver) {//左上の×が押されたとき
    button=-1;
    kingaku="";
    scene=0;
  }
}
