module Web::Views::Home
  class Index
    include Web::View
    include Hanami::Assets::Helpers

    Hanami::Assets.configure do
      compile true

      sources << [
        'web/assets',
      ]
    end

  end
end
