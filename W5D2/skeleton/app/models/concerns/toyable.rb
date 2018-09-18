module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys
  end

  def receive_toy(name)

  end
end
