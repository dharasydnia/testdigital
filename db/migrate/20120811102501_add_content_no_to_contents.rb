class AddContentNoToContents < ActiveRecord::Migration
  def change
    add_column :contents, :content_no, :string
  end
end
