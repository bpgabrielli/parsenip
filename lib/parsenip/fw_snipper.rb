require 'nokogiri'
require 'open-uri'

class Parsenip::FwSnipper

  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def get_class_items(item)
    data.css(item).text
  end

  def title
    data.css('h1').text.strip
  end

  def meta
    data.css('div.cooking-time').text.strip.split.join(" ")
  end

  def time
    data.css('#time-total/span').text.strip.split.join(" ")
  end

  def servings
    data.css('#time-servings/span').text.strip.split.join(" ")
  end

  def intro
    data.css('div.deck/p').first.text.strip + " Suggested Pairing: " + data.css('#pairing/p').text.strip
  end

  def ingredients
    data.css('#ingredients/ol/li/span/p').map { |i| i.text.split.join(" ") } || data.css('#ingredients/ol/li/span').map { |i| i.text.split.join(" ") }
  end

  def steps
    data.css('#directions/ol/li/span').map { |i| i.text.split.join(" ") }
  end

  def image
    data.css('div.image-frame/img').attr('src').text
  end

  def recipe
    recipe_hash = Hash.new
    recipe_hash = { title: self.title, meta: self.meta, time: self.time, servings: self.servings, intro: self.intro, ingredients: self.ingredients, steps: self.steps, image: self.image }
    recipe_hash
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

end