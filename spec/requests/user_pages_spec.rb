require 'spec_helper'


describe "User pages" do

  subject { page }

  describe "signup" do
    before { visit signup_path }
    
    let (:submit) { _('Create account') }
    
    describe "with invalid information" do      
      it "should not create an user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      it "should not create a Medical Center" do
        expect { click_button submit }.not_to change(MedicalCenter, :count)
      end
    end  
    
    describe "with valid information" do
      before do
        fill_in "Medical Center Name",   with: "Clinica Medica"
        fill_in "Address",               with: "Calle 13"
        fill_in "Phone Number",          with: "4731236"

        fill_in "Name",                  with: "Example User"
        fill_in "Email address",                 with: "user@example.com"
        fill_in "Password",              with: "foobar"
        fill_in "Password Confirmation",          with: "foobar"
      end
      it "should create an NEW user and a medical center" do
        expect { click_button submit }.to change(User, :count).by(1)
         #expect { click_button submit }.to change(MedicalCenter, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link(_('Dashboard')) }
        it { should have_selector('div.alert-success', text: 'Welcome') }
      end # after saving the user   
    end # with valid information  
  end #signup page

  describe "settings page" do
    let(:mc) { FactoryGirl.create(:medical_center) }
    let(:user) { FactoryGirl.create(:user, medical_center: mc) }
    
    
    before do
      sign_in user
      visit edit_user_path(user) 
    end

    it { should have_content (_('Update your data')) }
    it { should have_field('user_name', with: user.name) }
    it { should have_field('mc_phone_number', with: mc.phone_number) }
    

    it { should have_button(_('Save changes') )}
  end #end settings page 
  
end #user page  

