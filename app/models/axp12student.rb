class Axp12student < ActiveRecord::Base
  validates :name, :presence => true
  validates :mobile, :presence => true
  after_save    :expire_all_cached
  after_destroy :expire_all_cached
  
  def self.all_cached
    Rails.cache.fetch('Axp12student.all') { all }
  end
  
  def expire_all_cached
    Rails.cache.delete('Axp12student.all')
  end
  
end
