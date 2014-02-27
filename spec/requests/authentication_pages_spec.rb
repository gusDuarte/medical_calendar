require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
      
    it { should have_content(_('Sign in')) }
    it { should have_title(_('Sign in')) }
  end

  describe "signin" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button _('Sign in') }

      it { should have_title(_('Sign in')) }
      it { should have_selector('div.alert.alert-danger') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email address",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button _('Sign in')
      end

      it { should have_title(user.name) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      #it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end

  end                    
end

