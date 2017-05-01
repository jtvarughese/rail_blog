class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(
      user_id: session[:user_id],
      title: params[:post][:title],
      content: params[:post][:content],
      date: params[:post][:date]
    )

    if @post.save
      flash[:notice] = "Post created"
      redirect_to "/posts"
    else
      flash[:alert] = "Post was not created"
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.date = params[:post][:date]

    if @post.save
      flash[:notice] = "Changes saved!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Unable to save changes"
      redirect_to edit_post_path(@post)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy

    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post was deleted"
      session[:post_id] = nil
      redirect_to posts_path
    else
      flash[:alert] = "Unable to delete post"
      redirect_to edit_post_path
    end
  end
end
