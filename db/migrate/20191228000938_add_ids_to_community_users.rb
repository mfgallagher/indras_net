class AddIdsToCommunityUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :community_users, :user_id, :integer
    add_column :community_users, :community_id, :integer
  end
end
