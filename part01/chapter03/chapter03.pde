size(800, 600);

// HSBで色を指定する。（色相＝360, 彩度＝100, 明度＝100, 透明度＝100）
colorMode(HSB, 360, 100, 100, 100);

background(0);
noStroke();

// 円の直径
float diameter;

// 色相、明度、彩度、透明度をfloat型で格納する
float hue, saturation, brightness, alpha;

// 色を格納する変数
color col;

// 色を設定
hue = 200;
saturation = 100;
brightness = 20;
alpha = 90;
col = color(hue, saturation, brightness, alpha);

// 円は画面の半分の大きさ
diameter = width / 2;

// 円を表示
fill(col);
ellipse(width / 8, height / 2, diameter, diameter);

// 彩度を変更して円を表示
brightness += 20;
col = color(hue, saturation, brightness, alpha);
fill(col);
ellipse(width / 8 * 3, height / 2, diameter, diameter);

// さらに彩度を変更して円を表示
brightness += 20;
col = color(hue, saturation, brightness, alpha);
fill(col);
ellipse(width / 8 * 5, height / 2, diameter, diameter);

// さらに彩度を変更して円を表示
brightness += 20;
col = color(hue, saturation, brightness, alpha);
fill(col);
ellipse(width / 8 * 7, height / 2, diameter, diameter);
