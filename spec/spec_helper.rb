require 'rubygems'
require 'bundler/setup'
require 'rack/test'
require 'status_cats'
require 'test_app'

RSpec::Matchers.define :be_replaced_with_cat do |code|
  match do |actual|
    if code.nil?
      actual.body != "Hello, World!"
    else
      path = File.expand_path("../../cats/#{code}.jpg", __FILE__)
      file = File.open(path, 'rb')
      actual.body == file.read &&
      actual.status == code &&
      actual.headers["Content-Length"] == file.size.to_s &&
      actual.headers["Content-Type"] == "image/jpeg"
    end
  end

end
