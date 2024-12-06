# frozen_string_literal: true

require 'json'
require 'ostruct'
require 'bundler'

Bundler.setup(:default)

require_relative 'open_struct_json'
Dir[__dir__ + "/tormenta20/*.rb"].each {|file| require file }

module Tormenta20; end
