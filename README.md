# cpp-namespace-link-test
C++でほぼ同じコードを別々のnamespaceで囲み、それらを1つのバイナリにリンクするテスト

```
make
./build/main
```

- `lib`内に、2つのビルドオプションa,bで別々にビルドしたいコードが入っている。
- 各ソースをビルドし、`.o`ファイルをまとめて`build/libmy{a,b}.a`に出力（ここまでは別個のライブラリの状態）
- 一旦`.a`を解凍し、ファイル名をリネーム(オプションaの場合は`core.o`->`name_a_core.o`など)
  - 同じファイル名の`.o`ファイルを1つの`.a`に入れられないので
- 全オブジェクトファイルを`build/libmyconcat.a`にまとめる
- 両方のライブラリを用いる`src/main.cpp`をビルドし、`build/libmyconcat.a`を含めてリンク

