require 'rails_helper'

RSpec.describe "rates/edit", type: :view do
  let(:rate) {
    Rate.create!(
      user: nil,
      post: nil,
      score: 1
    )
  }

  before(:each) do
    assign(:rate, rate)
  end

  it "renders the edit rate form" do
    render

    assert_select "form[action=?][method=?]", rate_path(rate), "post" do

      assert_select "input[name=?]", "rate[user_id]"

      assert_select "input[name=?]", "rate[post_id]"

      assert_select "input[name=?]", "rate[score]"
    end
  end
end
