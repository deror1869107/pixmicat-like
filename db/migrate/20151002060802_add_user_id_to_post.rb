class AddUserIdToPost < ActiveRecord::Migration
  def change
    add_column(:posts, :userid, :string)
  end
end
