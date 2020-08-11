class Evaluation < ActiveHash::Base
  self.data = [
    {id: 1, evaluation: '高評価'}, {id: 2, evaluation: '低評価'}
  ]

  include ActiveHash::Associations
  has_many :user_evaluations
end