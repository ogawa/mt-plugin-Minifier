# Minifier

HTMLやスタイルシートやJavaScriptファイルのminify機能を実現するプラグイン

## Overview

Minifierプラグインを使うと、HTMLやスタイルシートやJavaScriptのテンプレートをminifyし、出力ファイルサイズを圧縮することができます。

## Installation

 * Minifier-<version>.zipファイルをダウンロードし、展開します。
 * Minifier-<version>/plugins ディレクトリの内容を、Movable Typeのpluginsディレクトリにアップロードまたはコピーします。
 * インストールが正常に済めば、「システムプラグイン設定」の画面で「Minifier」プラグインが確認できるでしょう。

## タグおよびモディファイア

Minifierプラグインは、mt:HTMLMinifier、mt:CSSMinifier、mt:JSMinifierという3つのブロックタグを提供しています。

### mt:HTMLMinifier

HTMLテンプレートをminifyするブロックタグ。

使用例:

    <mt:HTMLMinifier>
    (HTML template)
    </mt:HTMLMinifier>

### mt:CSSMinifier

スタイルシートテンプレートをminifyするブロックタグ。

使用例:

    <mt:CSSMinifier>
    (CSS template)
    </mt:CSSMinifier>

### mt:JSMinifier

JavaScriptテンプレートをminifyするブロックタグ。

使用例:

    <mt:JSMinifier>
    (JavaScript template)
    </mt:JSMinifier>

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [here](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2010, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
