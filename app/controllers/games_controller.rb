require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @answer = params[:answer]

    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    response = URI.open(url).read
    @valid = JSON.parse(response)["found"]

    @letters = params[:letters_array]

    @included = @answer.chars.all? do |letter|
      # puts letter
      # puts answer.count(letter)
      # puts letters.count(letter)
      @answer.count(letter) <= @letters.count(letter)
    end
  end
end
