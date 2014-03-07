require 'spec_helper'


describe "Doctor pages" do

  subject { page }

  describe "for non-signed-in users" do
    describe "visiting Doctor list view" do
      before { visit doctors_path }
      it { should have_title(_('Sign in')) }
    end # visiting Doctor List view
  end # for non-signed-in users

    
  describe "doctor creation" do 
    let (:submit) { _('New Doctor') }
    let(:mc)     { FactoryGirl.create(:medical_center) }
    let(:user)   { FactoryGirl.create(:user, medical_center: mc) }
    
    before do 
      sign_in user
      visit new_doctor_path 
    end  
      
    describe "with invalid information" do      
      it "should not create an Doctor" do
        expect { click_button submit }.not_to change(Doctor, :count)
      end      
      it "should show an error message" do
        expect { should have_selector('div.alert-danger', text: 'Error')  }
      end
    end  
    
    describe "with valid information" do
      before do
        fill_in "Name",                  with: "Bill Cosby"
        fill_in "Speciality",            with: "Cardiology"
        fill_in "Email Address",         with: "user@example.com"
        fill_in "Phone Number",          with: "4731236"
      end
      
      it "should create an NEW Doctor" do
        expect { click_button submit }.to change(Doctor, :count).by(1)
      end
      
      describe "after saving the doctor" do
        before { click_button submit }  
        it { should have_link(_('Dashboard')) }
        it { should have_selector('div.alert-success', text: 'New Doctor created') }
      end # after saving the user   
    end # with valid information
  end # create a doctor

    
  describe "edit" do
    let (:mc)     { FactoryGirl.create(:medical_center) }
    let (:user)   { FactoryGirl.create(:user, medical_center: mc) }
    let (:doctor) { FactoryGirl.create(:doctor, medical_center: mc) }
 
    before do
      sign_in user
      visit edit_doctor_path(doctor) 
    end
   
    
    describe "edit forms" do
      it { should have_title(_('Doctor data edit')) }
      it { should have_link(_('Data')) }
      it { should have_link(_('Patients')) }
    
      it { should have_field('doctor_name',  with: doctor.name) }
      it { should have_field('doctor_email', with: doctor.email) }
      it { should have_field('doctor_phone_number', with: doctor.phone_number) }
    
      it { should have_button(_('Update')) }
    end

  end  
end # Doctor pages  
