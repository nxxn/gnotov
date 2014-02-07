class Post < ActiveRecord::Base

  attr_accessible :title, :main_text, :show, :picture

  has_attached_file :picture,
                    :storage => :s3,
                    :styles => { :medium => "260x180>", :thumb => "100x100>", :original => "900x600>" },
                    :bucket => 'musthave-new',
                    :s3_credentials => {
                      :access_key_id => 'AKIAIELUBMUNHPAY37KQ',
                      :secret_access_key => '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'
                    }

end
