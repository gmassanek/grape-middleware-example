require 'grape'

module Api
  class V2 < Grape::API
    version '2.0', :using => :accept_version_header

    format :json

    resource :foo do
      get do
        Middleware.count
      end
    end
  end

  class V1 < Grape::API
    version ['1.0', '2.0'], :using => :accept_version_header

    format :json


    resource :foo do
      get do
        Middleware.count
      end
    end
  end

  class Middleware
    def self.count
      @count ||= 0
    end

    def self.count=(val)
      @count = val
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      self.class.count += 1
      @app.call(env)
    end
  end

  class App < Grape::API
    use Middleware

    mount V2
    mount V1
  end
end
