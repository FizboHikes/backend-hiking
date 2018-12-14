class Hike < ApplicationRecord
  belongs_to :user
  before_create :set_defaults

  def set_defaults
    if(self.image == '')
      self.image = "https://i.pinimg.com/originals/77/85/91/7785910e63b1662e8abe313c8ef9d160.jpg"
    end
  end

end
