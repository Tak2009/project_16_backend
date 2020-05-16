# README

# Rails API
1. $ --api
2. $ rails g resource
3. asscoiation
4. $ rails db:migrate

then to check whether it works
5. $ rails s 

now will do the following

6. config/routes.rbの設定
config -> routes.rb then set root
もちろん、ご自身のアプリの設定したいトップページをここに定義してください。
* 大事なのはトップページを何かしらに設定していることです。これをしないと本番環境(デプロイした後の環境)で「urlが正しく有りません」というエラーになる

7. Gemfileの設定: 
ここでは環境ごとのデータベースの変更を行なっています。
開発していた時(developmentやtest環境)はRailsアプリに最初からついているSQLite3というのを使っていたのですが、本番環境(production)、もといこれからデプロイする予定であるherokuではPostgreSQL(略してpg)というデータベースが最初からインストールされているので、その環境に合うようにこのような変更をしています。

7-1. comment out gem 'sqlite3 in Gemfile
7-2. Gemfileのgroup :development, :test do ~~ end内に　gem 'sqlite3' をdo ~ end内部に追加。他のgemは残す。
7-3. 以下を追加

group :production do
  gem 'pg'
end

7-4. $ bundle install --without production を忘れずに。オプションをつけることによって、group :produciton do~end内以外のgemをインストールすることができる。自分のパソコンにはPostgreSQLは入っていないため、このようなオプションをつけている。
* このオプションは一度打ち込めば、アプリ内部の/bundle/configというところに書き込まれるため、それ以降は--without producitonを打たなくても本番環境以外のgemをインストールしてくれるようになります。その他のbundle install時のオプションは全てここに書き込まれます。
* * .のついているファイルは隠しフォルダといい通常は見れないのですが、ターミナルでls -aとうてば確認することができます。(-aは隠しフォルダを表示するコマンドです。) .bundle/configに行って、このようになっていたらOK

BUNDLE_WITHOUT: "production"

8. onfig/datebase.ymlの設定。
Gemfileを変更したことによりこのアプリは本番環境でPostgreSQLを使うことになる。という宣言（と機能をインストールするための準備）は完了したのですが、実際にデータベースと接続する記述はまだ完了していない。その接続の設定をする箇所がconfigフォルダの中にあるdatabase.ymlというファイル。

config/database.yml内のproduction環境についての設定を、以下のように変更。
* production:以降の記述は必ず半角スペース２個ぶんの空白を開けて記述してください。.ymlという拡張子のファイルはインデントで記述を判別

production:
  <<: *default
  adapter: postgresql
  encoding: unicode
  pool: 5

9. config/environments/production.rbの設定
* ただし今回は --apiモードで、フィロントエンドはべつに作るので、ここは無視

        Railsは本番環境での動的な画像の表示(というかプリコンパイル)がデフォルトでオフになっている。画像を表示するために以下の記述をfalseからtrueに変更してください。（自分は31行目にありました）この記述により、assets以下のフォルダから動的にコンパイルしながらページを読み込む。

        config/environments/production.rb
        #デフォルトでfalseとなっている以下の箇所をtrueに変更
        config.assets.compile = true


10. bin以下のフォルダの設定(任意)

* * この設定は人によっては大丈夫なことも多いのですが、rbenvなどを使ってない人は陥りがちなことが多いので一応記述しておきます。

後述するのですが、データベース周りの設定は完璧なのにheroku run rails db:migrateが通らない人はここの箇所で詰まっている人が多いです。

アプリ内にbinというフォルダがあるのですが、その中のファイル全て(bundle,rails,rake,setup,spring, update,yarn)の一番上に

#!/usr/bin/env ruby

という記述があると思います。ここの記述が、

#!/usr/bin/env ruby 2.3.1

などバージョン指定されてしまっているファイル全てのバージョンを削除してください。つまり、上の記述から

#!/usr/bin/env ruby

このように数字を削除するということになります。(今回は2.3.1の部分)


# 以下は自分のローカル環境にPostgresを入れたい場合。上の設定ではプロダクションとテストを分けているが以下をすると分ける必要なしになる。

    # install postgresql
    1. $ brew install postgresql

    2. check if installed
    $ postgres --version

    3. check the default path
    $ which postgres

    4. set the PGDATA environment variable. brew でinstall時にデフォルトで/usr/local/var/postgresに作成されたものを使うのが一般的みたい
    $ export PGDATA=/usr/local/var/postgres

# Herokuの登録

1. herokuの機能を自分のPCに紐付けましょう。Heroku Command Line Interface, 今回はMac用をインストール。

$ brew tap heroku/brew && brew install heroku

2. $ heroku --versionで
>>heroku/7.0.47 darwin-x64 node-v12.16.2
が出てきたらOK

3. PCからherokuにログイン
$ heroku loginを打つと

heroku: Press any key to open up the browser to login or q to exit:

と出てくるので指示に従う。

pening browser to https://cli-auth.heroku.com/auth/cli/browser/xxxxxxxxxxxxxxxxxxxxxxx
Logging in... done
Logged in as xxxxxx@xxxx.com

と出てきたら完了。

4. アプリごとに最初の一回だけ！
$ heroku create 好きなアプリ名 (「好きなアプリ名」に入力する文字列はurlになるものです。_とか使えないので注意！)

例
$ heroku create local-biz-supporter
>> Creating ⬢ local-biz-supporter... done
>> https://local-biz-supporter.herokuapp.com/ | https://git.heroku.com/local-biz-supporter.git

5. herokuにデプロイ
ここからデプロイ。ターミナルで以下のコマンド実行。

$　git push heroku master

herokuを使うと、このようにコマンド一つでRailsアプリがデプロイできる。

詳しくみていくと、このタイミングでproductionでのbundle installや
rake assets:precompile(ざっくりいうと画像の表示)なども行われているのがわかる。

    remote:        Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
    remote:        The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
    remote:        Fetching gem metadata from https://rubygems.org/............

自分の指定したアプリ名を含んだurlが生成されていますが、これがまさに自分のアプリのURL

    remote: Verifying deploy... done.
    To https://git.heroku.com/local-biz-supporter.git
    * [new branch]      master -> master

6. 本番環境(heroku)でのマイグレーション

$ heroku run rails db:migrate

heroku runをつけるとheroku上でrailsコマンドを打つことができます。他にもheroku run rails cなどなど、色々ありますので調べてみましょう。

以上でherokuでのデプロイは完了になります！早速、先ほどメモしたURLをブラウザのアドレスバーに貼り付けて、確認する。

以上


# Heroku Commands

heroku ps:	アプリケーションのプロセスを確認、起動停止もこちらを利用	
heroku releases:	リリース（デプロイ）の記録を表示	
heroku logs:	アプリケーションのログを表示	
heroku container	今回は扱いませんがDocker imageをpushできる..!	
heroku config:	環境変数設定や、Basic認証をかけたい時に	
heroku maintenance:	停止はしないけどメンテ画面にするとか

1. to stop dynos
$ heroku ps:scale web=1

2. to start up dynos
$ heroku ps:scale web=0

3. How to restrict access instead of shutting down the server.
$ heroku maintenance:on
heroku psをしてみますと、プロセスは起動していることは確認できるが
ブラウザから確認してみると、メンテナンス画面（という趣旨）のレスポンスが返ってくる。
デベロッパーツールの　Networkを見ると503でサーバーが落ちている時と同じ

4. How to access while maintenance:on
Basic認証を使うと良いのですが、アプリケーション&アプリケーションサーバごとに方法がことなる
メンテモードの時は自分もアクセスできなくなるのでBasic認証を設定しておくと、自分だけはアクセスできる。

# Basic 認証　basic verification

1.RailsアプリをHerokuにデプロイして個人用に動かしているので、そこにBasic認証の機能を設定したときのメモ。
2.以下をApplication Contorllerに

    class ApplicationController < ActionController::Base
      before_action :basic

      private
      def basic
        http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.production?
      end
    end

  プロダクション環境だけBASIC認証をかけたいなら

    if Rails.env == "production"

　を追加。

* 特定のコントローラーだけに認証をかけたいならapplication.rbではなくそのコントローラーのファイルに書き

3.　.envで環境変数を管理しているのでそちらに記載

　　　BASIC_AUTH_NAME=hegohego
　　　BASIC_AUTH_PASSWORD=fugafuga

4.　Herokuの環境変数も設定する。Railsの知識ではなくHerokuの知識

  ＃＃ herokuの環境変数を確認
  $ heroku config

  ＃＃ herokuの環境変数を追加・変更
  $ heroku config:set BASIC_AUTH_NAME=hogehoge
  $ heroku config:set BASIC_AUTH_PASSWORD=fugafuga

5.　.gitignoreを編集　作成した.envファイルがgithubにアップされないように.gitignoreファイルに記述

    #下記を追記
    /.env


# How to access Heroku DB from local PC

https://qiita.com/akiko-pusu/items/305e291465d6aac04bf3



参照先：

heroku deploy
https://qiita.com/kazukimatsumoto/items/a0daa7281a3948701c39

heroku commands
https://qiita.com/akiko-pusu/items/dec93cca4855e811ba6c

basic verification
https://qiita.com/veqcc/items/7e64a68d99493776231c

https://ytkg.hateblo.jp/entry/2019/11/26/131621




その他参照
Enviroment Variables 2
https://www.task-notes.com/entry/20160920/1474343389

How To Use Environment Variables in Ruby　Basic認証を設定した
https://qiita.com/yuichir43705457/items/7cfcae6546876086b849

How To Use Environment Variables in Ruby
https://www.rubyguides.com/2019/01/ruby-environment-variables/

curl
https://qiita.com/kaizen_nagoya/items/f13df3e2c9fe6c3bf6fc


test