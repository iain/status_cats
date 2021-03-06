require 'rack/file'

class StatusCats

  CATS = [ 100, 200, 206, 207, 300, 301, 302, 303, 307, 401, 402, 403, 404, 405, 406, 408, 409, 410, 413, 414, 416, 417, 418, 422, 423, 424, 426, 429, 431, 444, 450, 500, 502, 507, 508, 599 ].freeze
  CATS_DIR = File.expand_path("../../cats", __FILE__)

  def initialize(app, options = {})
    @app, @options = app, options
  end

  def call(env)
    @status, @headers, @response = @app.call(env)
    if display_cat?
      _, @headers, @response = Rack::File.new(CATS_DIR).call("PATH_INFO" => "#{@status}.jpg")
    end
    [ @status, @headers, @response ]
  end

  def display_cat?
    cats = CATS
    if @options.has_key?(:only)
      cats = Array(@options[:only]) & cats
    end
    if @options.has_key?(:except)
      cats = cats - Array(@options[:except])
    end
    cats.include?(@status.to_i)
  end

end
