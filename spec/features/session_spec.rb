require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before :each do
    @usr1 = User.create(username: 'John', fullname: 'John Arboleda')
    @usr2 = User.create(username: 'maria', fullname: 'María Vélez')
    visit '/sign_in'
    sleep 10
    fill_in 'session_username', with: 'John'
    click_button 'Login'
    sleep 10
  end

  it 'visit own profile page' do
    visit profile_path(@usr1.username)
    sleep 10
    expect(page).to have_text('ALL CONTENT SUGGESTED BY JOHN ARBOLEDA')
  end

  it 'visit other profile page' do
    visit 'users/maria'
    sleep 10
    expect(page).to have_text('ALL CONTENT SUGGESTED BY MARÍA VÉLEZ')
  end

  it 'follow a user which has profile page open' do
    visit 'users/maria'
    sleep 10
    expect(page).to have_text('0 Following')
    find('a.follow_me').click
    sleep 10
    expect(page).to have_text('1 Following')
  end

  it 'should logout' do
    click_link 'Sign out'
    sleep 10
    expect(page).to have_text('Written by Fanatics for Fanatics')
  end
end
