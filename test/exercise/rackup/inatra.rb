module Inatra
  @routes = {}
  @request_methods = [:get, :post]
  class << self
    def routes(&block)
      instance_eval(&block)
    end

    def call(env)
      path = env['PATH_INFO']
      request_method = env['REQUEST_METHOD'].downcase.to_sym
      begin
        @routes[request_method][path].call
      rescue
        raise 'wrong route'
      end
    end

    def method_missing(method_name, *arguments, &block)
      if @request_methods.include?(method_name)
        add_route(method_name, arguments.first, &block)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @request_methods.include?(method_name) || super
    end

    private

    def add_route(request_method, path, &block)
      @routes.store(request_method, {}) unless @routes.key?(request_method)
      @routes[request_method].store(path, block)
    end
  end
end
