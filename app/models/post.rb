class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :rates, foreign_key: 'post_id', dependent: :destroy

  after_create :update_user_posts_counter_on_create
  after_destroy :update_user_posts_counter_on_destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rates_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter_on_create
    user.increment!(:posts_counter)
  end

  def update_user_posts_counter_on_destroy
    user.decrement!(:posts_counter)
  end
end
