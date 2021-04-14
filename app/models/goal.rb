class Goal < ApplicationRecord
    belongs_to :user #ゴールはユーザーに持たれています
    has_many :tasks #Goalはtaskをたくさん持っています
    belongs_to :monster
end
