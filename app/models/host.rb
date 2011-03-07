class Host < ActiveRecord::Base
  STATUS_NAMES = {:unknown => 0, :up => 1, :down=> 2}

  attr_accessible :name, :memory, :status_name
  
  has_many  :packages

  scoped_search :on => :name, :complete_value => true
  scoped_search :on => :created_at,:rename => :created, :complete_value => true
  scoped_search :on => :memory, :only_explicit => true, :complete_value => true
  scoped_search :on => :status, :complete_value => STATUS_NAMES
  scoped_search :in => :packages, :on => :name, :complete_value => true, :rename => 'packages.name'.to_sym
  scoped_search :in => :packages, :on => :version, :only_explicit => true, :complete_value => true , :rename => 'packages.version'.to_sym

  def to_s
    name
  end



  def status_name= s
    write_attribute(:status, STATUS_NAMES[s.to_sym])
  end

  def status_name
    return :unknown unless status
    STATUS_NAMES.each_pair{|key, value| return key  if value == status}
  end
end
