require 'nokogiri'
require 'open-uri'

class Parsenip::SkSnipper
#TODO: Make this work :(
  attr_reader :url, :data

  def initialize(url)
    @url = url
  end

  def get_class_items(item)
    data.css(item).text
  end

  def title
    data.css('strong').text
  end

  def meta
    data.css('ul.recipe-time-yield').text.strip.split.join(" ")
  end

  def intro
    data.css('div.topnote/p').first.text.strip
  end

  def ingredients
    data.css('ul.recipe-ingredients/li').map { |i| i.text.split.join(" ") }
  end

  def steps
    data.css('ol.recipe-steps/li').map { |s| s.text.split.join(" ") }
  end

  def image
    data.css('div.media-container/img').attr('src').text
  end

  def recipe
    recipe_hash = Hash.new
    recipe_hash = { title: self.title, meta: self.meta, intro: self.intro, ingredients: self.ingredients, steps: self.steps, image: self.image }
    recipe_hash
  end

  def data
    @data ||= Nokogiri::HTML(open(url))
  end

end