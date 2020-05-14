# README

# rails api
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

7. Gemfileの設定

8. onfig/datebase.ymlの設定
9. config/environments/production.rbの設定
10. bin以下のフォルダの設定(任意)


# install postgresql
1. $ brew install postgresql

2. check if installed
$ postgres --version

3. check the default path
$ which postgres

4. set the PGDATA environment variable. brew でinstall時にデフォルトで/usr/local/var/postgresに作成されたものを使うのが一般的みたい
$ export PGDATA=/usr/local/var/postgres

