require 'spec_helper'

describe "User page" do
  subject { page }

  describe "signup" do
    before { visit signup_path }
    
    let (:submit) { _('Create my account') }
    
    describe "with invalid information" do      
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end  
    
    describe "with valid information" do
      before do
        fill_in "Name",                  with: "Example User"
        fill_in "Email address",         with: "user@example.com"
        #fill_in "Rol",                   with: "recepcionist"
        #fill_in "Medical Center",        with: "Acme Medical Center"
        fill_in "Password",              with: "foobar"
        fill_in "Password Confirmation", with: "foobar"
      end
      it "should create a user" do
         expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        #it { should have_link(_('Sign out')) }
        it { should have_link(_('Dashboard')) }
        it { should have_title(user.name) }
        it { should have_selector('div.alert-success', text: 'Welcome') }
      end # after saving the user   
    end # with valid information  
  end #signup page
end #user page  