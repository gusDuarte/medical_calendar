require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "all static pages" do

    it { should have_title(full_title(page_title)) }
    
    it { should have_link('Home',      href: root_path) }
    #it { should have_link('Settings',  href: settings_path(user)) }
    #it { should have_link('About',     href: about_path(user)) }
    #it { should have_link('Contact',   href: contact_path) }
    #it { should have_link('Help',      href: help_path) }
    
  end


  describe "Home page" do
    before { visit root_path }

    let(:page_title) { '' }
    let(:heading) { '' }

    it { should have_content('Medicos') }
    it { should have_content('Pacientes') }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path } 
   
    let(:page_title) { 'About Us' }
    let(:heading) { 'About Us' }
    
    it_should_behave_like "all static pages"
  end

  describe "Help page" do
    before { visit help_path } 
   
    let(:page_title) { 'Help' }
    let(:heading) { 'Help' }

    it_should_behave_like "all static pages"
  end

end
