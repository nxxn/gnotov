class Work < ActiveRecord::Base

  translates :description

  attr_accessible :url, :description, :show, :picture


  has_attached_file :picture,
                    :storage => :s3,
                    :styles => { :medium => "210x133>", :thumb => "100x100>", :original => "900x600>" },
                    :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90', :original => '-strip -interlace plane -quality 60'},
                    :bucket => 'musthave-new',
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }

end
