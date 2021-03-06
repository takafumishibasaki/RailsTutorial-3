require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Sample app') }
    it { should have_title(full_title('')) }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in(user)
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_content('About') }
    it { should have_title(full_title('About')) }
  end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end

  describe "Sign up page" do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
end
