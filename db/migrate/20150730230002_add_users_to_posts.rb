class AddUsersToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    # excellent! it seems you have a place for users, but are not
    # inserting this info when a new post is saved.
  end
end
