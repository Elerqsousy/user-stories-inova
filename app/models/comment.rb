class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_comments_counter_on_create
  after_destroy :update_post_comments_counter_on_destroy

  private

  def update_post_comments_counter_on_create
    post.increment!(:comments_counter)
  end

  def update_post_comments_counter_on_destroy
    post.decrement!(:comments_counter)
  end
end
