class Chapter < ActiveRecord::Base
  attr_accessible :chapter_no, :school_stage, :statutaryauthority, :title, :parent_id, :ancestry
  has_ancestry

  has_many :contents
  belongs_to :user
end
