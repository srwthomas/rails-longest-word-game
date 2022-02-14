require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @params = params
    @valid_grid = wordFitsGrid(params[:word], params[:letters]) # word buildable from provided letters?
    results = checkEnglishWord(params[:word])
    @valid_english = results['found'] # word is valid english word?

    # word must be buildable from provided letters
    # word is valid english word
  end

  private

  def wordFitsGrid(word, letters)
    word = word.upcase!
    letters = letters.upcase.gsub(' ', '')
    dif_letters = letters
    word.split('').each do |letter|
      puts letter
      dif_letters = dif_letters.sub(/#{letter}/, '')
    end

    (letters.length - dif_letters.length) == word.length
    # if difference is equal length of word, it matches letters
  end

  def checkEnglishWord(word)
    word_serialized = URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read
    JSON.parse(word_serialized)
  end
end
