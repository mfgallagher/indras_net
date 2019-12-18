class AddCommunitiesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :has_community, :boolean, default: false
  end
end
