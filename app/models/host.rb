class Host < ActiveRecord::Base
  STATUS_NAMES = {:unknown => 0, :up => 1, :down=> 2}
  BITS = {:num_of_sockets => [0,8], :num_of_cores => [1,8], :num_of_interfaces => [2,8], :num_of_disks =>[3,8]}

  attr_accessible :name, :memory, :status_name, :num_of_cores
  
  has_many  :packages

  scoped_search :on => :name, :complete_value => true
  scoped_search :on => :created_at,:rename => :created, :complete_value => true
  scoped_search :on => :memory, :only_explicit => true, :complete_value => true
  scoped_search :on => :status, :complete_value => STATUS_NAMES
  scoped_search :on => :bits, :offset => 1, :word_size => 8, :rename => :cores
  scoped_search :on => :bits, :offset => 0, :word_size => 8, :rename => :sockets
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

  def num_of_cores= h
    word_size = BITS[:num_of_cores][1]
    offset = BITS[:num_of_cores][0]
    write_attribute(:bits, bits | (h.to_i << offset*word_size) )
  end

  def num_of_cores
    word_size = BITS[:num_of_cores][1]
    offset = BITS[:num_of_cores][0]
    max = 2**word_size -1
    (bits >> offset*word_size) & max
  end

end
