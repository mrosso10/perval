

cd /var/www

git clone git@github.com:mrosso10/perval.git

rbenv install 2.3.0

gem install bundler

bundle install

sudo -u postgres psql template1

create role perval password 'perval' createdb login;

bundle exec hanami db create

bundle exec hanami assets precompile

puma -e production -b unix:///var/www/perval/tmp/sockets/perval-puma.sock -d

pkill -f perval-puma.sock


kill `cat tmp/pids/puma.pid`; puma -b unix:///var/www/perval/tmp/sockets/perval-puma.sock -d -e production --pidfile tmp/pids/puma.pid # restart
