require 'rails_helper'

RSpec.describe "rates/new", type: :view do
  before(:each) do
    assign(:rate, Rate.new(
      user: nil,
      post: nil,
      score: 1
    ))
  end

  it "renders new rate form" do
    render

    assert_select "form[action=?][method=?]", rates_path, "post" do

      assert_select "input[name=?]", "rate[user_id]"

      assert_select "input[name=?]", "rate[post_id]"

      assert_select "input[name=?]", "rate[score]"
    end
  end
end
