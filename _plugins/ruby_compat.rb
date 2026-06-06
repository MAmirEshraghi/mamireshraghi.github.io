# Preload gems removed from Ruby 3.4+ default gems that Jekyll 3.x still expects.
require 'csv'
require 'bigdecimal'
require 'base64'
require 'mutex_m'
require 'logger'
require 'drb'

# Ruby 3.2+ removed taint tracking; Liquid 4.x still calls #tainted? on objects.
unless Object.method_defined?(:tainted?)
  class Object
    def tainted?
      false
    end

    def untaint
      self
    end
  end
end
