class Work < ActiveRecord::Base

  translates :description

  attr_accessible :url, :description, :show, :picture


  has_attached_file :picture,
                    :storage => :s3,
                    :styles => { :medium => "210x133>", :thumb => "100x100>", :original => "900x600>" },
                    :convert_options => {:thumb => '-strip -interlace plane -quality 90', :medium => '-strip -interlace plane -quality 90', :original => '-strip -interlace plane -quality 60'},
                    :bucket => 'musthave-new',
                    :s3_credentials => {
                      :access_key_id => 'AKIAIELUBMUNHPAY37KQ',
                      :secret_access_key => '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'
                    }

end
