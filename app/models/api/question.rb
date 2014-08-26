class Api::Question < ActiveRecord::Base
  belongs_to :category
end
