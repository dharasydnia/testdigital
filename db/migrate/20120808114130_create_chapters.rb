class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :title
      t.string :chapter_no
      t.text :statutaryauthority
      t.string :school_stage

      t.timestamps
    end
  end
end
