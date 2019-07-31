require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test 'get sign up form and create user' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path params: { user: { username: 'i_just_farted', email: 'i_just@farted.de', password: 'fart'}}
      follow_redirect!
    end
    assert_template 'users/show'
    assert_match 'i_just_farted', response.body
  end
end
