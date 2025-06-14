int defaultYear = year();//最初の画面の年
int defaultMonth = month();//最初の画面の月
int selectedDay = 1;
int rectRX, rectRY;//右のボタンの座標
int rectLX, rectLY;//左のボタンの座標
int rectSize = 20;//ボタンのサイズ
int scene=0;//シーンを指定する番号
int button;
int delaycounter=0;//シーン変更時に次のシーンで誤作動が起きないようにするためのカウンター

boolean leftButtonOver = false;
boolean rightButtonOver = false;
boolean NumberButtonover = false;
boolean numberkey = false;
boolean numberCancelOver = false;

color currentColor = #FFD2FF;//背景の色
String[] s = {"7", "8", "9", "4", "5", "6", "1", "2", "3", "削除", "0", "決定"};//数字キーの順番
String[] d = {"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"};//曜日の順番
String kingaku = "";//数字キーの入力した数字
String[]genjou;//入力された金額の保存

/*カレンダーの背景のイラスト*/
PImage img_January;
PImage img_Feburuary;
PImage img_March;
PImage img_April;
PImage img_May;
PImage img_June;
PImage img_July;
PImage img_August;
PImage img_September;
PImage img_October;
PImage img_November;
PImage img_December;

void setup() {
  PFont font = createFont("Meiryo", 20);
  textFont(font);
  size(480, 640);
  background(255);
  rectLX = width/2-150;//左のボタンのx座標
  rectLY = 40;//左のボタンのy座標
  rectRX = width/2+130;//右のボタンのx座標
  rectRY = 40;//右のボタンのy座標

  genjou = loadStrings("data.txt");//入力された金額のデータ

  /*カレンダーの背景のイラスト*/
  img_January=loadImage("January.PNG");
  img_Feburuary=loadImage("Feburuary.PNG");
  img_March=loadImage("March.PNG");
  img_April=loadImage("April.png");
  img_May=loadImage("May.png");
  img_June=loadImage("June.png");
  img_July=loadImage("July.png");
  img_August=loadImage("August.png");
  img_September=loadImage("September.png");
  img_October=loadImage("October.png");
  img_November=loadImage("November.png");
  img_December=loadImage("December.png");
}

void draw() {
BackGround();
  if (scene==0) {//カレンダーの画面
    if (delaycounter>0) {//シーン変更時に次のシーンで誤作動が起きないようにするためのカウンター
      delaycounter--;
    }
    update();//
    drawCalendar(defaultYear, defaultMonth);//カレンダーの表示
  } else if (scene==1) {//金額入力画面
    if (delaycounter>0) {//シーン変更時に次のシーンで誤作動が起きないようにするためのカウンター
      delaycounter--;
    }
    numberkey();//数字キー自体の表示
    money();//数字キーの入力と入力内容の表示
  }
}
