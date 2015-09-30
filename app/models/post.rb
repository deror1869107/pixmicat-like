class Post < ActiveRecord::Base
  has_attached_file :upfile, styles: { medium: "250x250>" }#, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :upfile, content_type: /\Aimage\/.*\Z/
end
