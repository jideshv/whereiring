class AddUsersToAdminUser < ActiveRecord::Migration
  def change
    # Change default users
    AdminUser.delete_all
    AdminUser.create!(:email => 'jideshv@debugit.com', :password => 'Booth!!2013', :password_confirmation => 'Booth!!2013')
  end
end
