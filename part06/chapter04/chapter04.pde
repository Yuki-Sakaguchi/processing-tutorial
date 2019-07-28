import processing.sound.*;
AudioIn in;
FFT fft; // FFT（高速フーリエ変換）

// FFTサイズを設定（一度にどれだけ解析するか。大きいと分析の解像度が高くなる）
// FFTアルゴリズムの関係で2の累乗で指定する必要がある
int bands = 1024;

float scale = 20.0; // グラフの高さのスケール

void setup () {
  size(800, 600);

  in = new AudioIn(this, 0);
  in.start();

  // FFTを初期化
  fft = new FFT(this, bands);
  fft.input(in);
}

void draw () {
  background(0);
  
  fft.analyze(); // マイクからの入力をFFT解析
  
  float w = width / float(bands); // グラフの横幅を算出
  noFill();
  stroke(255);
  beginShape(); // 線分の描画開始
  // FFTのバンドの数だけ繰り返し
  for (int i = 0; i < bands; i++) {
    // FFTの解析結果を高さにブラフを描く
    vertex(i * width/float(bands), height - fft.spectrum[i] * height * scale);
  }
  endShape(); // 線分の描画終了
}
