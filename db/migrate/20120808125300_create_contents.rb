class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :title
      t.integer :number
      t.string :content_type
      t.integer :chapter_id
      t.string :source_note
      t.text :statutaryauthority
      t.text :unnumberedparagraph
      t.integer :parent_id

      t.timestamps
    end
  end
end
