#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path("../../lib", __FILE__)
$DATA_PATH = File.expand_path("../../data", __FILE__)

require 'Traveller'
require 'Trooper'
require 'character'
require 'Chargen'
require 'json'
require 'pp'

data_file = "#{$DATA_PATH}/soldiers.json"
if File.exists?(data_file)
  chars_in = File.read(data_file)
  chars = Hash.new
  chars, valid_json = Traveller.valid_json?(chars_in)
end 

if valid_json
  careers = %w[ Mountainman Warder Path Citizen Guide Army Navy College Entertainer ]
  careers.each do |key|
    chars.each_key do |char|
      if chars[char]['career'] == key
        this_char = Character.new(chars[char])
        Traveller.write(this_char, 'csv')
      end
    end
  end
end
 
