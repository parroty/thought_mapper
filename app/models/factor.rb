class Factor < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :candidate
  belongs_to :view_point

  module Score
    LOW    = 1
    MIDDLE = 2
    HIGH   = 3

    def self.all
      self.constants.map do |name|
        [name.capitalize, self.const_get(name)]
      end
    end

    def self.name_of(score)
      if score = all.find { |name, value| value == score }
        score.first.to_s
      else
        ""
      end
    end
  end

  def self.scores
    Score.all
  end

  def score_name
    Score.name_of(score)
  end
end
