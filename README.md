# README

# install postgresql
1. $ brew install postgresql

2. check if installed
$ postgres --version

3. check the default path
$ which postgres

4. set the PGDATA environment variable. brew でinstall時にデフォルトで/usr/local/var/postgresに作成されたものを使うのが一般的みたい
$ export PGDATA=/usr/local/var/postgres