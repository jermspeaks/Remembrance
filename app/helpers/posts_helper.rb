module PostsHelper
  def bad_text?(post)
    string_array = post.text.downcase.split(' ')
    @score = score(string_array)
    post.update(approved: false) if @score <= -5
  end

  def score(string_array)
    @filter_number = 0
    string_array.each do |word|
      obscenity = Word.find_by(negativity: word)
      if obscenity
        @filter_number += obscenity.rank
      end
    end
    @filter_number
  end 
end
