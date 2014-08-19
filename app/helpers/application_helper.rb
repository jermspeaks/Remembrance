module ApplicationHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def set_approved_to_false(text_object)
    text_object.update(approved: false)
  end

  def bad_text?(object_text)
    string_array = object_text.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
    @score = score(string_array)
    @score <= -5
  end

  private
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
