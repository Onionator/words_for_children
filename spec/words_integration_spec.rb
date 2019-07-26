require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a new word', {:type => :feature}) do
  it('creates a new word and then goes back to home') do
    visit('/')
    click_on('Add a New Word')
    fill_in('new_word', :with => 'Pizza')
    click_on('Create')
    expect(page).to have_content('Pizza')
  end
end

describe('create a definition for a word', {:type => :feature}) do
  it('creates a new definition') do
    visit('/')
    click_on('Pizza')
    fill_in('new_definition', :with => '30 minutes or it is FREE!')
    click_on('Add Definition')
    expect(page).to have_content('30 minutes or it is FREE!')
  end
end

describe('update a definition for a word', {:type => :feature}) do
  it('updates the definition of a word') do
    visit('/')
    click_on('Pizza')
    click_on('Edit')
    fill_in('new_definition', :with => 'The greatest circle of food to ever grace the face of the earth with its cheesy presence.')
    click_on('Update Definition')
    expect(page).to have_content('The greatest circle of food to ever grace the face of the earth with its cheesy presence.')
  end
end

describe('cancel an edit of a definition for a word', {:type => :feature}) do
  it('returns to home page') do
    visit('/')
    click_on('Pizza')
    click_on('Edit')
    click_on('cancel')
    expect(page).to have_content('Pizza')
  end
end

describe('remove a definition for a word', {:type => :feature}) do
  it('removes a definition') do
    visit('/')
    click_on('Pizza')
    click_on('Edit')
    click_on('Remove')
    expect(page).not_to have_content('The greatest circle of food to ever grace the face of the earth with its cheesy presence.')
  end
end
