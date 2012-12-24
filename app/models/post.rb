class Post < ActiveRecord::Base

  attr_accessible :content, :name, :title
  validates_presence_of :title,  :message => "should not be empty or blank"
  #validates :name,  :presence => true
  #validates :title, :presence => true,
  #          :length => { :minimum => 5 }

end
