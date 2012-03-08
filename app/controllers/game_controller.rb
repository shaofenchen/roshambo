class GameController < ApplicationController
#session :on
before_filter :initThrow, :only  => [:throw, :begin]

 def initThrow
  @defeat = {:rock => :scissors, :paper => :rock, :scissors => :paper, :lizard => :spock,  :spock => :scissors}
  @defeat2 = {:rock => :lizard,  :paper => :spock, :scissors => :lizard, :lizard => :paper, :spock => :rock}
  @throws = @defeat.keys
  @msg = ""
end

# before_filter do
  # @defeat = {rock => :scissors, paper => :rock, scissors => :paper}
  # @throws = @defeat.keys
  # @computer_throw = @throws.sample
# end

 def throw
  # the params[] hash stores querystring and form data.
  player_throw = params[:type].to_sym

  # in the case of a player providing a throw that is not valid,
  # we halt with a status code of 403 (Forbidden) and let them
  # know they need to make a valid throw to play.
  if !@throws.include?(player_throw)
    @msg = "You must throw one of the following: #{@throws}"
  end

  # now we can select a random throw for the computer
  computer_throw = @throws.sample

  # compare the player and computer throws to determine a winner
  if @throws.include?(player_throw)
	  if player_throw == computer_throw
		@msg = "You tied with the computer. Try again! #{session[:ties]} "
		if (session[:ties]) == nil
			session[:ties] = 1
		else 
		session[:ties] = session[:ties] + 1
		end
	  elsif (computer_throw == @defeat[player_throw] or computer_throw == @defeat2[player_throw])
		@msg = "Nicely done; #{player_throw} beats #{computer_throw}! #{session[:pwins]}"
		if (session[:pwins]) == nil
		session[:pwins] = 1
		else 
		session[:pwins] = session[:pwins] + 1
		end
	  else 
		@msg = "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!#{session[:cwins]}"
		if (session[:cwins]) == nil
		session[:cwins] = 1
		else 
		session[:cwins] = session[:cwins] + 1
		end
	  end
  end
  
  end

  def begin
  
  end

  def stat
	@msg = "You win #{session[:pwin] + 1} times, computer win #{session[:cwin]  + 1} times, tie #{session[:tie]  + 1}"
  end
end
