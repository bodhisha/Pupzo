class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  def create
    p = Post.create(post_params)
    flash.notice = "Post Created Sucessfully"
    redirect_to root_path
  end

  # GET /posts/id
  def show
    @post = Post.find(params[:id])
  end

  #DELETE /posts/id
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash.alert = "Post Deleted Sucessfully!"
    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:description, :image).merge(user_id: current_user.id)
  end
end
