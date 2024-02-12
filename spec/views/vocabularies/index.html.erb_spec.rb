require 'rails_helper'

RSpec.describe "vocabularies/index", type: :view do
  before(:each) do
    assign(:vocabularies, [
      Vocabulary.create!(
        word: "Word",
        translation: "MyText",
        context: "MyText",
        user: nil
      ),
      Vocabulary.create!(
        word: "Word",
        translation: "MyText",
        context: "MyText",
        user: nil
      )
    ])
  end

  it "renders a list of vocabularies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Word".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
