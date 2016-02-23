class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :connect]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html, :js

  def index
    Post.reindex
    if (params.has_key?(:to) || params.has_key?(:from) || params.has_key?(:when_date))
    	conditions = {}
	if params[:when_date].present?
	  tmp = DateTime.strptime(params[:when_date], '%m/%d/%Y')
          ltez = DateTime.new(tmp.year, tmp.month, tmp.day, 23, 59, 59, 0)
          gtez = DateTime.new(tmp.year, tmp.month, tmp.day, 0, 0, 0, 0)
          conditions[:when_date] = { gte: gtez, lte: ltez }
	end
	conditions[:to_id] = params[:to] if params[:to].present?
    	conditions[:from_id] = params[:from] if params[:from].present?

	@posts = Post.search("*",
        order: {when_date: :desc}, 
        where: conditions 
     )
    else
	@posts = Post.all.order('created_at DESC')
     end
  end
  
  def show
  end

   def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    
    # Save the post
    if @post.save
      flash[:notice] = 'Post Created'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
   @post.update(post_params)    
   redirect_to post_path

  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post Deleted'
      redirect_to posts_path
    else
      render 'destroy'
    end

  end
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :to_id, :from_id, :when_date, :user_id)
  end

end
