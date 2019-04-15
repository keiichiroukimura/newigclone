class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]
  before_action :ensure_correct_user,{only: [:edit, :update,:destroy,]}
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
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    render :new if @post.invalid?
  end

  def edit;end
	
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "新規投稿。"
      redirect_to posts_path
      SendMailer.send_mail(@post).deliver 
    else
      render 'new'
    end
  end

  def update
    @post.user_id == current_user.id
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
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

  def ensure_correct_user
    if @post.user_id != current_user.id
      redirect_to posts_path 
    end
  end
end