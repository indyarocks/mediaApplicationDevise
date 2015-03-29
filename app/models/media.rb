class Media < ActiveRecord::Base
  enum permission: {is_private: 0, is_public: 1}
  belongs_to :user
end
