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
  @definitions = Definition.find_by_word(:word_id)
  erb(:word)
end

get '/new_word' do
  erb(:new_word)
end

post '/new_word' do
  Word.new({:word => params[:new_word]}).save
  redirect to('/')
end

post '/word/definition/new' do
  temp = Definition.new({:definition => params[:new_definition], :word_id => params[:word_id]})
  temp.save
  binding.pry
  redirect to('/')
end