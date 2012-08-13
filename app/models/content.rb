class Content < ActiveRecord::Base
  attr_accessible :chapter_id, :content_type, :number, :parent_id, :source_note, :statutaryauthority, :title, :unnumberedparagraph, :ancestry, :content_no

  has_ancestry

  belongs_to :chapter
  belongs_to :user
end
