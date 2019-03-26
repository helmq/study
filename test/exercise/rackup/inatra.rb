module Inatra
  @routes = {}
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      path = env['PATH_INFO']
      @routes[path].call
    end

    def method_missing(method_name, *arguments, &block)
      if method_name == :get
        @routes.store(arguments.first, block)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name == :get || super
    end
  end
end
