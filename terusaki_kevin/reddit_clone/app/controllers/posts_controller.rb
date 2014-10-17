class PostsController < ApplicationController
	def index
		@post = params[:post]

		# show posts based on search keyword
		if params[:post][:search]
			if params[:post][:search]
				puts 'in index if'
				@posts = Post.search('test')

			end
		# otherwise, show all posts
		else
			puts 'in index else'
			@posts = Post.order(vote: :desc)
		end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to posts_path
		else
			render 'new'
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
			rerender 'update'
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
			count = @post.vote += 1
		else
			count = @post.vote -= 1
		end

		if @post.update_attributes(:vote => count)
			redirect_to @post
		else
			rerender 'show'
		end
	end

	private 
		def post_params
			params.require(:post).permit(:title, :url, :vote)
		end
end
