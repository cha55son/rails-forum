class AddLastActivityAt < ActiveRecord::Migration
  def change
      add_column :categories, :last_activity_at, :datetime, :null => false, :default => Time.now
      add_column :categories, :last_activity_user_id, :integer
      add_column :topics, :last_activity_at, :datetime, :null => false, :default => Time.now
      add_column :topics, :last_activity_user_id, :integer
  end
end
