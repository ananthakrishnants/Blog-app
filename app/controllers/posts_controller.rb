class PostsController < ApplicationController
	
	def new
		@post=Post.new
	end
	def index
		@posts = Post.where(:user_id => current_user.id)
	end

	def create
		@post=Post.new(post_params)
		@post.save
		redirect_to @post
	end

	def show
		@post=Post.find(params[:id])
		
	end
	def destroy
        @post=Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
	end
	private 
	def post_params
		params.require(:post).permit(:body,:user_id)
	end
end
