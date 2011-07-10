class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :books

  default_scope :order => 'LOWER(authors.last_name)'


  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end
end
