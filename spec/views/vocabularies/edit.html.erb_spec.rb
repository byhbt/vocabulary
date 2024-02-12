require 'rails_helper'

RSpec.describe "vocabularies/edit", type: :view do
  let(:vocabulary) {
    Vocabulary.create!(
      word: "MyString",
      translation: "MyText",
      context: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:vocabulary, vocabulary)
  end

  it "renders the edit vocabulary form" do
    render

    assert_select "form[action=?][method=?]", vocabulary_path(vocabulary), "post" do

      assert_select "input[name=?]", "vocabulary[word]"

      assert_select "textarea[name=?]", "vocabulary[translation]"

      assert_select "textarea[name=?]", "vocabulary[context]"

      assert_select "input[name=?]", "vocabulary[user_id]"
    end
  end
end
