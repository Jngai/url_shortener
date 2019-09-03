class ShortenersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def new 
	end

	def create
	  @url = Shortener.new
	  @url.long_url = params["long_url"]
	  if @url.save
	  	render json: @url
	  else 
	  	render 'new'
	  end
	end

	def shortened_page
	end

	def shortened 
	  redirect_to Shortener.find_by_short_url(params["short_url"]).long_url
	end
end
