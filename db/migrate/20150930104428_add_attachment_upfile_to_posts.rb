class AddAttachmentUpfileToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :upfile
    end
  end

  def self.down
    remove_attachment :posts, :upfile
  end
end
