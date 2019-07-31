require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'i_just_farted', email: 'i_just@farted.de', password: 'fart', admin: true)
    @article = Article.create(id: 1, title: 'Florida man strikes again', description: 'Florida man is on a killing rampage in front of Taco Bell', user: @user)
  end

  test 'should get articles index' do
    get articles_path
    assert_response :success
  end

  test 'should get article show' do
    get article_path(@article)
    assert_response :success
  end

  test 'should get article new' do
    sign_in_as(@user, 'fart')
    get new_article_path
    assert_response :success
  end

  test 'should redirect new when user not logged in' do
    get new_article_path
    assert_redirected_to root_path
  end

  test 'should redirect edit when user not logged in' do
    get edit_article_path(@article)
    assert_redirected_to root_path
  end

  test 'should redirect create when user not logged in' do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { title: 'dupa title', description: 'supa dupa description', user: @user} }
    end
    assert_redirected_to root_path
  end
end
