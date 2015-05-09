class Factor < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :candidate
  belongs_to :view_point
end
