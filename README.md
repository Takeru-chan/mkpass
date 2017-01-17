#PowerShell script to make a password.
パスワードを生成するPowerShellスクリプトです。  
Qiitaに投稿した[PowerShellでパスワード生成](http://qiita.com/Takeru/items/da17c8ae9122bca6f2d4)と
[PowerShellで生成したパスワードを暗号化して保存する](http://qiita.com/Takeru/items/c8c769f88e8ccb06ffe3)を使って、
少し汎用性をもたせたスクリプトにしてみました。  

※シェルスクリプト版はパスワード生成のみでログは残しません。  

##Usage | 使い方
引数なしで起動すると英小文字と数字を組み合わせた８桁のパスワードを生成します。  
引数に整数を指定することで任意の長さのパスワードを生成できます。  
以下オプションの組み合わせにより、パスワード生成に使用される文字種を指定できます。  

* -u 英大文字
* -l 英小文字
* -n 数字
* -s 記号
* -a 上記全文字種
* -x 紛らわしい文字(I1l|0O)を除外する（シェルスクリプト版のみ）

生成したパスワードは生成日時に続けて暗号化された状態で、ホームディレクトリ中のpasswd.logに追記されます。  
復号方法は[PowerShellで生成したパスワードを暗号化して保存する](http://qiita.com/Takeru/items/c8c769f88e8ccb06ffe3)を参照してください。  

例）  
2017/01/12 22:52:19 01000000d08c9ddf0115d1118c7a00c04fc297eb01000000f01bb26b297c5c49be1c148addfcc00f0000000002000000000003660000c0000000100000006e1b3680bc87a3956426cc8bf3c8f03c0000000004800000a000000010000000b932a8b7cc446dd1a5d7c28d88f106bb18000000c8ad080bc460351ab8a64fa1ec53b466a636fd3012b0b35e140000005f384b07721a9675ec72b8724574ab235792e5e8  

##License
This script has released under the MIT license.  
[http://opensource.org/licenses/MIT](http://opensource.org/licenses/MIT)