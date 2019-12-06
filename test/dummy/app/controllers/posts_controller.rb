class PostsController < ApplicationController
  def index
    @collection = collection
  end

  def show
    @post = resource
  end

  def new
    @post = collection.new
  end

  def create
    @post = collection.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = resource
  end

  def update
    @post = resource
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = resource
    @post.destroy
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit!
  end

  def collection
    Post.all
  end

  def resource
    collection.find(params[:id])
  end
end
