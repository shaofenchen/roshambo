class GameController < ApplicationController
#session :on
before_filter :initThrow, :only  => [:throw, :begin]

 def initThrow
 #I make a mistake to use ruby 1.8.7, so the hash syntax is different from ruby 1.9, as shown below:
  @defeat = {:rock => :scissors, :paper => :rock, :scissors => :paper, :lizard => :spock,  :spock => :scissors}
  @defeat2 = { :rock => :lizard, :paper => :spock, :scissors => :lizard, :lizard => :paper, :spock => :rock} 
  @throws = @defeat.keys
  @msg = ""
end

 def throw
  # the params[] hash stores querystring and form data.
  if !(params[:type] == nil)
  player_throw = params[:type].to_sym

  # in the case of a player providing a throw that is not valid,
  # we halt with a status code of 403 (Forbidden) and let them
  # know they need to make a valid throw to play.
  if !@throws.include?(player_throw)
    @msg = "You must throw one of the following: #{@throws}"
  end
  end

  # now we can select a random throw for the computer
  computer_throw = @throws.sample

  # compare the player and computer throws to determine a winner
  if @throws.include?(player_throw)
	  if player_throw == computer_throw
		if (session[:ties]) == nil
			session[:ties] = 1
		else 
		session[:ties] = session[:ties] + 1
		end
		@msg = "You tied with the computer. Try again! #{session[:ties]} "
	  elsif (computer_throw == @defeat[player_throw] or computer_throw == @defeat2[player_throw])
		if (session[:pwins]) == nil
		session[:pwins] = 1
		else 
		session[:pwins] = session[:pwins] + 1
		end
		@msg = "Nicely done; #{player_throw} beats #{computer_throw}! #{session[:pwins]}"

	  else 
		if (session[:cwins]) == nil
		session[:cwins] = 1
		else 
		session[:cwins] = session[:cwins] + 1
		end
		@msg = "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!#{session[:cwins]}"		
	  end
  end
  
  end

  def begin
	redirect_to :action => "throw"
  end

  def stat
	@msg = "You win #{session[:pwins]} times, computer win #{session[:cwins]} times, tie #{session[:ties]} times."
  end
end
