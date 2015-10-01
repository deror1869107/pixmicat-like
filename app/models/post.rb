class Post < ActiveRecord::Base

  before_create :change_file_name

  has_attached_file :upfile, styles: { medium: "250x250>" }#, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :upfile, content_type: /\Aimage\/.*\Z/

  private

  def change_file_name
    if not self.upfile_file_name.nil?
      extension = File.extname(upfile_file_name).downcase
      self.upfile.instance_write(:file_name, "#{self.created_at.to_i}#{extension}")
    end
  end
end
