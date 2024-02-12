require 'rails_helper'

RSpec.describe "vocabularies/show", type: :view do
  before(:each) do
    assign(:vocabulary, Vocabulary.create!(
      word: "Word",
      translation: "MyText",
      context: "MyText",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
