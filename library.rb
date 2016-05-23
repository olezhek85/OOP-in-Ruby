require './author'
require './book'
require './order'
require './reader'
require 'yaml'

class Library
  attr_reader :books, :orders, :readers, :authors
  
  def initialize
    @books = []
    @orders = []
    @readers = []
    @authors = []
  end
  
  def who_often_takes_the_book
    @orders.group_by(&:book).values.max_by(&:size).first.reader
  end
  
  def what_is_the_most_popular_book
    @orders.group_by(&:book).values.max_by(&:size).first.book
  end
  
  def how_many_people_ordered_one_of_the_three_most_popular_books
    @orders.group_by(&:book).values.max_by(&:size).max_by(3).group_by(&:reader)
  end
  
  def save_all_Library_data_to_file(file_name = 'library.yaml')
    library = YAML::dump(self)
    File.open(file_name, library)
  end
  
  def get_all_library_data_from_file(file_name = 'library.yaml')
    YAML.load_file(file_name) if File.exist?(file_name)
  end
end
