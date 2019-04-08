class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy ]
	
	def index
		@posts = Post.all.order(id: "DESC") 
	end

	def new
		if params[:back]
			@post = Post.new(post_params)
		else
			@post = Post.new
		end
	end
	
	def show
		@favorite = current_user.favorites.find_by(post_id: @post.id)
	end	
	
	def confirm
		@post = current_user.posts.build(post_params)
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end
	
	def destroy
		@post.destroy
    flash[:danger] = "投稿を削除しました。"
    redirect_to posts_path
	end
		
	private
	
	def set_post
    @post = Post.find(params[:id])
  end
	
	def post_params
		params.require(:post).permit(:image, :image_cache, :content, :user_id)
	end
end