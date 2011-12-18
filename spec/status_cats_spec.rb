require 'spec_helper'

describe StatusCats do

  include Rack::Test::Methods

  describe "cat responses" do

    let(:app) { StatusCats.new(TestApp.new) }

    StatusCats::CATS.each do |code|

      it "displays cat for status #{code}" do
        get code.to_s
        last_response.should be_replaced_with_cat(code)
      end

    end

  end

  describe ":only" do

    let(:app) { StatusCats.new(TestApp.new, :only => 200...300) }

    it "will replace response with a cat if status is within range" do
      get "206"
      last_response.should be_replaced_with_cat(206)
    end

    it "will not replace if there is no file for it" do
      get "201"
      last_response.should_not be_replaced_with_cat
    end

    it "will not replace if out of range" do
      get "404"
      last_response.should_not be_replaced_with_cat(404)
    end

  end

  describe ":except" do

    let(:app) { StatusCats.new(TestApp.new, :except => 200...300) }

    it "will replace response with a cat if status is not in range" do
      get "404"
      last_response.should be_replaced_with_cat(404)
    end

    it "will not replace response with a cat if status is in range" do
      get "206"
      last_response.should_not be_replaced_with_cat(206)
    end

    it "won't replace cats that are not known" do
      get "201"
      last_response.should_not be_replaced_with_cat
    end

  end

end
