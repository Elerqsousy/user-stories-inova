require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      user: nil,
      title: "MyText",
      body: "MyText"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[user_id]"

      assert_select "textarea[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[body]"
    end
  end
end
