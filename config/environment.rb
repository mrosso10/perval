require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/perval'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/perval_development.sqlite3'
    #    adapter :sql, 'postgres://localhost/perval_development'
    #    adapter :sql, 'mysql://localhost/perval_development'
    #
    # adapter :sql, ENV['DATABASE_URL']
    adapter :sql, 'postgres://perval:perval@localhost/perval_development'

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/perval/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery do
      development :test
      test        :test
      # production :smtp, address: ENV['SMTP_PORT'], port: 1025
    end
  end
end
