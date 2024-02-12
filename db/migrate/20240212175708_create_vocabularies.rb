class CreateVocabularies < ActiveRecord::Migration[7.1]
  def change
    create_table :vocabularies do |t|
      t.string :word
      t.text :translation
      t.text :context
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
