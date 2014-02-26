require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "almost static pages" do

    it { should have_title(full_title(page_title)) }
    
    it { should have_link(_('About'),     href: about_path) }
    it { should have_link(_('Contact'),   href: contact_path) }
    it { should have_link(_('Help'),      href: help_path) }
    
  end



  describe "Login page" do
    before { visit root_path } 
   
    let(:page_title) { _('Login') }
    let(:heading) { _('Login') }


    it { should_not have_link(_('Dashboard'), href: dashboard_path) }
    it { should_not have_link(_('Settings'), href: settings_path) }
    it { should_not have_link(_('Sign out'), href: signup_path) }

    it { should have_selector('a.btn', text: _('Sign in')) }
    it { should have_link(_('Create an Account NOW !'), href: signup_path) }
  end


  describe "About page" do
    before { visit about_path } 
   
    let(:page_title) { _('About Us') }
    let(:heading) { _('About Us') }
    
    it_should_behave_like "almost static pages"
  end

  describe "Help page" do
    before { visit help_path } 
   
    let(:page_title) { _('Help') }
    let(:heading) { _('Help') }

    it_should_behave_like "almost static pages"
  end

  describe "Contact page" do
    before { visit contact_path } 
   
    let(:page_title) { _('Contact') }
    let(:heading) { _('Contact') }

    it_should_behave_like "almost static pages"
  end
end
