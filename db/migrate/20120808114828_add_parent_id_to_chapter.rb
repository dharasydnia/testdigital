class AddParentIdToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :parent_id, :integer
  end
end
