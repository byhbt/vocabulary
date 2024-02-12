require 'rails_helper'

RSpec.describe "vocabularies/new", type: :view do
  before(:each) do
    assign(:vocabulary, Vocabulary.new(
      word: "MyString",
      translation: "MyText",
      context: "MyText",
      user: nil
    ))
  end

  it "renders new vocabulary form" do
    render

    assert_select "form[action=?][method=?]", vocabularies_path, "post" do

      assert_select "input[name=?]", "vocabulary[word]"

      assert_select "textarea[name=?]", "vocabulary[translation]"

      assert_select "textarea[name=?]", "vocabulary[context]"

      assert_select "input[name=?]", "vocabulary[user_id]"
    end
  end
end
