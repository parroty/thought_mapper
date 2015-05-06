class Topic < ActiveRecord::Base
  has_many :view_points, dependent: :destroy
end
