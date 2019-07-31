require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'i_just_farted', email: 'i_just@farted.de', password: 'fart', admin: true)
  end

  test 'get new article form and create article' do
    sign_in_as(@user, 'fart')
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path params: { article: { title: 'Supa dupa title', description: 'Supa dupa description maka paka', user: @user}}
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match 'Supa dupa title', response.body
  end
end
