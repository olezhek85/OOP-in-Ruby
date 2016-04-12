require 'book'

RSpec.describe Book do
  def book(params = {})
    defaults = {
      title: 'Harry Potter and the Cursed Child , Parts I & II',
      author: 'J.K. Rowling, Jack Thorne, John Tiffany'
    }
    Book.new(*defaults.merge(params).values_at(:title, :author))
  end
  
  it 'has a title' do
    expect(book(title: 'Me Before You').title).to eq('Me Before You')
  end

  it 'has a author' do
    expect(book(author: 'Jojo Moyes').author).to eq('Jojo Moyes')
  end
end