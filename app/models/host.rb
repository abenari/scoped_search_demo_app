class Host < ActiveRecord::Base
    attr_accessible :name, :memory
    scoped_search :on => [:name, :memory]
end
