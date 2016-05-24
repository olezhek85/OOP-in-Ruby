require_relative 'author'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require 'yaml'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books   = []
    @orders  = []
    @readers = []
    @authors = []
  end

  def who_often_takes_the_book
    @orders.group_by(&:reader).values.max_by(&:size).first.reader
  end

  def what_is_the_most_popular_book
    @orders.group_by(&:book).values.max_by(&:size).first.book
  end

  def how_much_readers_ordered_popular_books(cnt = 3)
    @orders.group_by(&:book).max_by(cnt) { |_book, order| order.size }
          .map { |_book, order| order.first.reader }.uniq.count
  end

  def save_all_library_data_to_file(file_name = 'library.yml')
    File.open(file_name, 'w') { |f| f.write(YAML.dump(self)) }
  end

  def get_all_library_data_from_file(file_name = 'library.yml')
    YAML.load_file(file_name) if File.exist?(file_name)
  end
end

library = Library.new
stats = library.get_all_library_data_from_file('data/library.yml')

puts stats.who_often_takes_the_book
puts stats.what_is_the_most_popular_book
puts stats.how_much_readers_ordered_popular_books
