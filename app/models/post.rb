class Post < ActiveRecord::Base

  attr_accessible :title, :main_text, :show, :picture

  has_attached_file :picture,
                    :storage => :s3,
                    :styles => { :medium => "260x180>", :thumb => "100x100>", :original => "900x600>" },
                    :bucket => 'musthave-new',
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

  scope :shown, where('show = ?', true)
  scope :published, order("updated_at desc")

end
