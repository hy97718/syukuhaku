class Rooms::SearchesController < ApplicationController
	def index
		@rooms = Room.search(params[:keyword], params[:area])
		@search_word = params[:keyword]
		@search_area = params[:area]
	end 
end
