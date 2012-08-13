class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :title

      t.timestamps
    end
  end
end
