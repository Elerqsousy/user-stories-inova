require 'rails_helper'

RSpec.describe "rates/show", type: :view do
  before(:each) do
    assign(:rate, Rate.create!(
      user: nil,
      post: nil,
      score: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
