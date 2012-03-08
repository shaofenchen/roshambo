require 'spec_helper'

describe GameController do

  describe "GET 'throw'" do
    it "should be successful" do
      get 'throw'
      response.should be_success
    end
  end

  describe "GET 'begin'" do
    it "should be successful" do
      get 'begin'
      response.should be_redirect
    end
  end

  describe "GET 'stat'" do
    it "should be successful" do
      get 'stat'
      response.should be_success
    end
  end

end
