#--
# Copyright 2017, Huub de Beer <Huub@heerdebeer.org>
# 
# This file is part of pandocomatic.
# 
# Pandocomatic is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
# 
# Pandocomatic is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
# 
# You should have received a copy of the GNU General Public License along
# with pandocomatic.  If not, see <http://www.gnu.org/licenses/>.
#++
module Pandocomatic
  require_relative '../printer/error_printer.rb'

  class PandocomaticError < StandardError
    attr_reader :type, :error, :data
    def initialize(type = :unknown, error = nil, data = nil)
      super type.to_s.gsub("_", " ").capitalize
      @type = type
      @error = error
      @data = data
    end

    def has_error?()
      not @error.nil?
    end

    def has_data?()
      not @data.nil?
    end

    def print()
      ErrorPrinter.new(self).print
    end

    def show()
      ErrorPrinter.new(self).to_s
    end

  end
end 
