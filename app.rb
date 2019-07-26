require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/words')
require('./lib/definitions')

get '/' do
  @words = Word.all
  erb(:index)
end

get '/word/:word_id' do
  @word = Word.find(params[:word_id].to_i)
  @definitions = Definition.find_by_word(params[:word_id].to_i)
  erb(:word)
end

get '/new_word' do
  erb(:new_word)
end

post '/new_word' do
  Word.new({:word => params[:new_word]}).save
  redirect to('/')
end

post '/word/:word_id/define' do
  Definition.new({:definition => params[:new_definition], :word_id => params[:word_id].to_i}).save
  @definitions = Definition.find_by_word(params[:word_id].to_i)
  @word = Word.find(params[:word_id].to_i)
  erb(:word)
end

post '/word/:word_id/remove_definition/:definition_id' do
  Definition.remove(params[:definition_id].to_i)
  @definitions = Definition.find_by_word(params[:word_id].to_i)
  @word = Word.find(params[:word_id].to_i)
  erb(:word)
end
