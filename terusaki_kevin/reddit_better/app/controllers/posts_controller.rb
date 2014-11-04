class PostsController < ApplicationController
	def index
		@user = current_user
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		binding.pry

		if user_signed_in?
			@post = Post.new(post_params)

			@post.user_id = current_user.id;
			if @post.save
				redirect_to posts_path
			else
				render 'new'
			end
		else
			redirect_to new_user_session_path
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	def voting
		@post = Post.find(params[:id])
		if params[:commit] == 'Upvote'
			count = @post.votes += 1
		else
			count = @post.votes -= 1
		end

		if @post.update_attributes(:votes => count)
			redirect_to @post
		else
			rerender 'show'
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :link, :user_id, :votes)
	end
end
