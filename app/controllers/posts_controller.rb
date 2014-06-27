class PostsController < ApplicationController
	
	def index
		@posts = Post.shown.published
	end

	def show
		@post = Post.find(params[:id])
	end

end