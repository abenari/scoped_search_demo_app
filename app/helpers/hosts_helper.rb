module HostsHelper

  def memory_column size
    number_to_human_size size*1024 if size
  end
end
