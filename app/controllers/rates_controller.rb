class RatesController < ApplicationController
  def new
    @rate = Rate.new
  end

  def create
    @post = Post.find(params[:post_id])
    @rate = Rate.new(post_id: @post.id, user_id: current_user.id, score:)

    if @like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: "Can't create another Rate"
    end
  end
end
