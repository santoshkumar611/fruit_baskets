require 'active_support/concern'

module Blending
  extend ActiveSupport::Concern

  included do
    after_save :make_juice , if: proc {|obj| obj.instance_of?(Apple) }
    
    def make_juice
      puts "calling for only apple class"
    end
  end
end