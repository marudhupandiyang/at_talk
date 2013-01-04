class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user , :tags_attributes

  validates :title , :presence => true, :format => { :with => /[a-z0-9 ]+/i , :message => 'Title Should contain only AlphaNumeric and Spaces' }

  validates :body, :presence => true , :length => {:minimum => 150 }

  has_many :comments , :dependent =>  :destroy

  has_many :tags

  accepts_nested_attributes_for :tags , :allow_destroy => true,
                                :reject_if => proc{ |attrs|  attrs.all?{ |k,v| v.blank? } }
end
