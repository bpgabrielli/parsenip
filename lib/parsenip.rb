require "parsenip/version"

module Parsenip

  def self.snip(url)
    if url.include?('nytimes.com')
      Parsenip::NytSnipper.new(url)
    elsif url.include?('smittenkitchen.com')
      Parsenip::SkSnipper.new(url)
    elsif url.include?('foodandwine.com')
      Parsenip::FwSnipper.new(url)
    end
  end

end

require "parsenip/nyt_snipper"
require "parsenip/sk_snipper"
require "parsenip/fw_snipper"