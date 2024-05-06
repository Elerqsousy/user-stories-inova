class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_rates_counter_on_create
  after_destroy :update_post_rates_counter_on_destroy

  private

  def update_post_rates_counter_on_create
    post.increment!(:rates_counter)
  end

  def update_post_rates_counter_on_destroy
    post.decrement!(:rates_counter)
  end
end
