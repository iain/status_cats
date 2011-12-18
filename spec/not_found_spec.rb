require 'rubygems'
require 'bundler/setup'
require 'rack/test'
require 'status_cats'
require 'test_app'

describe StatusCats::Middleware do

  include Rack::Test::Methods

  let(:app) { StatusCats::Middleware.new(TestApp.new) }

  StatusCats::Middleware::CATS.each do |code|

    it "displays cat for status #{code}" do
      get code.to_s
      path = File.expand_path("../../cats/#{code}.jpg", __FILE__)
      file = File.open(path, 'rb')
      last_response.body.should == file.read
      last_response.status.should == code
      last_response.headers["Content-Length"].should == file.size.to_s
      last_response.headers["Content-Type"].should == "image/jpeg"
    end

  end

end
