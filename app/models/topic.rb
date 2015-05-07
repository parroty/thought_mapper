class Topic < ActiveRecord::Base
  has_many :view_points, -> { order(:position) }, dependent: :destroy
  has_many :candidates
end
