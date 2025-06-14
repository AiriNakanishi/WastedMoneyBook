boolean overRightButton(int x, int y, int width, int height) {//右のボタンにカーソルがあるかどうか
  if (mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overLeftButton(int x, int y, int width, int height) {//左のボタンにカーソルがあるかどうか
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overNumberButton(int x, int y, int w, int h) {//数字キーにカーソルがあるかどうか
  if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overNumberCancel(int x, int y, int w, int h) {//数字キー左上の×にカーソルがあるかどうか
  if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
    return true;
  } else {
    return false;
  }
}
