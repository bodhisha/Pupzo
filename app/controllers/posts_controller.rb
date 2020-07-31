class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    p = Post.create(post_params)
      redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:description, :image).merge(user_id: current_user.id)
  end
end
