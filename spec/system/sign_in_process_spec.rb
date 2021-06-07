require 'rails_helper'

RSpec.describe 'Sign in process', type: :feature do
  let(:user) { create :user }

  it 'should log me in when input is valid user details' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_signin', with: user.username
      fill_in 'user_signin', with: user.email
      fill_in 'user_password', with: user.password

      click_button 'Log in'
    end

    expect(page.current_path).to eq root_path
  end

  it 'should not log me in when input is invalid user details' do
    visit new_user_session_path

    within '#new_user' do
      fill_in 'user_signin', with: 'usernam*123'
      fill_in 'user_signin', with: 'ex*mple@email.com'
      fill_in 'user_password', with: 'passwo*d123'

      click_button 'Log in'
    end

    expect(page.current_path).to eq new_user_session_path
  end
end