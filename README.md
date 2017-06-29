# Print ICPC Library

It is the tiny shell script. You can merge source files into one TeX file, and export TeX to PDF easily. I would be glad if this script helps you make the library for ACM-ICPC.

---

なんてことないスクリプトです。複数のソースファイルを 1 つの TeX ファイルにまとめて PDF に簡単に出力できます。ACM-ICPC のライブラリ作成の助けになれば幸いです。

## Install

Clone or download this repository, and execute `generate.sh` by following the usage below.

---

このリポジトリをクローンまたはダウンロードして、下の使用例に従って `generate.sh` を実行してください。

## Usage

`usage: bash generate.sh [<filepath>] [<texfilename>] [<pagetitle>]`

* filepath: The path where files you want to merge exist
* texfilename: The filename of exported PDF file. File extention is not needed.
* pagetitle: It will be the pagetitle of PDF file

---

* filepath: マージしたいファイルがあるフォルダのパス
* texfilename: 出力される PDF ファイル名 (拡張子は必要ありません)
* pagetitle: PDF ファイル内のページタイトル

## Caution

* This is not verified except GNU Bash version 4.3.11.
* It requires pLaTeX, and dvipdfmx and imports `cpp` files by default. Please change `generate.sh`  in accordance with the situation.
* By default, TeX file is automatically erased and PDF file only remain. If you want to remain both TeX and PDF files, please comment-out 36th line of `generate.sh`.
* For International Readers: 3rd line of `tex_head.txt` is not essential because this package is needed only for displaying Japanese. Please comment-out this line.
* **Please note that I shall not be responsible for any loss, damages and troubles by using this program.**

---

* このプログラムは GNU Bash 4.3.11 以外では検証していません。
* デフォルトでは pLaTeX と dvipdfmx が必要で、`cpp` ファイルがインポートの対象になっています。環境に応じて `generate.sh` を変更してください。
* デフォルトでは PDF のみ残すことになっており、 TeX ファイルは実行後消えます。TeX ファイルも残したい場合は `generate.sh` 36 行目をコメントアウトしてください。
* 日本語も出力できるよう、`jlisting.sty` パッケージを使うようにしています。これが必要なければ、`tex_head.txt` の 3 行目をコメントアウトしてください。必要な場合、パッケージはこちらからダウンロードできます → [https://osdn.net/projects/mytexpert/downloads/26068/jlisting.sty.bz2/](https://osdn.net/projects/mytexpert/downloads/26068/jlisting.sty.bz2/)
* **このプログラムを利用したことによるいかなる損害やトラブルについて責任を負いません。自己責任でご利用ください。**

## Licence

[MIT Licence](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

If you have a question, please feel free to ask me.

Author: Tsutajiro

[Twitter (@\_TTJR\_)](http://twitter.com/_TTJR_)

[Github (Tsutaijro)](https://github.com/tsutajiro)
