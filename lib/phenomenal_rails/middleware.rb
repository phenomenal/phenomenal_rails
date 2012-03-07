module PhenomenalRails
  class Middleware
    def initialize(app)
      @app=app
    end
    
    def call(env)
      PhenomenalRails::Middleware.activation_handler(env)
      @app.call(env)
    end
    
    def self.activation_handler(env)
    end
  end
end
