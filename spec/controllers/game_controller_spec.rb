require 'spec_helper'

describe GameController do
render_views
  describe "GET 'throw/rock'" do
	before(:each) do
		@type = "rock"
	end
    it "should tie if computer throw rock" do
		srand(0) 
		# in my host, it force the throw.sample as follow:
		# srand 0 rock
		# srand 1 spock
		# srand 2 sissors
		# srand 3 lizard
		# srand 10 paper 
		get :throw, :type => @type
		response.should contain("You tied with")
    end
	
    it "should lose if computer throw spock" do
		srand(1) 
		get :throw, :type => @type
		response.should contain("Ouch")
    end	
    it "should win if computer throw sissors" do
		srand(2) 
		get :throw, :type => @type
		response.should contain("Nicely done")
    end	
    it "should win if computer throw lizard" do
		srand(3) 
		get :throw, :type => @type
		response.should contain("Nicely done")
    end	
    it "should lose if computer throw paper" do
		srand(10) 
		get :throw, :type => @type
		response.should contain("Ouch")
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
