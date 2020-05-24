class Pub < ApplicationRecord
    has_many :tickets
    # has_many :supporters, through: :tickets
end
