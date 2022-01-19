class CreateSynonyms < ActiveRecord::Migration[5.2]
  def change
    create_table :synonyms do |t|
      t.text :English_word
      t.text :Kannada_meaning
      
      t.timestamps
    end
  end
end
