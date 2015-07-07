require 'socket'

class Snippet < ActiveRecord::Base

  before_create do
    self.created_by = saved_by
  end

  before_save do |snippet|
    snippet.updated_by = saved_by
  end

  private
  def saved_by
    "#{hostname} (#{local_ip})"
  end

  def local_ip
    `ifconfig | awk '/inet addr/{print substr($2,6)}'`.split("\n").each do |ip|
      return ip if ip =~ /^10.10.150/
    end
  end

  def hostname
    Socket.gethostname
  end
end
