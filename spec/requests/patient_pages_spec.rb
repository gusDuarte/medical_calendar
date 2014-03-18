require 'spec_helper'


describe "Patient pages" do

  subject { page }

  describe "for non-signed-in users" do
    describe "visiting Patient list view" do
      before { visit patients_path }
      it { should have_title(_('Sign in')) }
    end # visiting patients List view
  end # for non-signed-in users

    
  describe "patient creation" do 
    let (:submit) { _('New Patient') }
    let(:mc)     { FactoryGirl.create(:medical_center) }
    let(:user)   { FactoryGirl.create(:user, medical_center: mc) }
    
    before do 
      sign_in user
      visit new_patient_path 
    end  
      
    describe "with invalid information" do      
      it "should not create a new Patient" do
        expect { click_button submit }.not_to change(Patient, :count)
      end      
      it "should show an error message" do
        expect { should have_selector('div.alert-danger', text: 'Error')  }
      end
    end  
    
    describe "with valid information" do
      before do
        fill_in "Name",                  with: "Juan Perez"
        fill_in "Email Address",         with: "juan.perez@example.com"
        fill_in "Phone Number",          with: "4731236"
      end
      
      it "should create a new Patient" do
        expect { click_button submit }.to change(Patient, :count).by(1)
      end
      
      describe "after saving the patient" do
        before { click_button submit }  
        it { should have_link(_('Dashboard')) }
        it { should have_selector('div.alert-success', text: 'New Patient created') }
      end # after saving the user   
    end # with valid information
  end # create a new patient

    
  describe "edit" do
    let (:mc)     { FactoryGirl.create(:medical_center) }
    let (:user)   { FactoryGirl.create(:user, medical_center: mc) }
    let (:patient) { FactoryGirl.create(:patient, medical_center: mc) }
 
    before do
      sign_in user
      visit edit_patient_path(patient) 
    end
   
    
    describe "edit forms" do
      it { should have_title(_('Patient data edit')) }
      it { should have_link(_('Data')) }
      it { should have_link(_('Appointment')) }
    
      it { should have_field('patient_name',  with: patient.name) }
      it { should have_field('patient_email', with: patient.email) }
      it { should have_field('patient_phone_number', with: patient.phone_number) }
    
      it { should have_button(_('Update')) }
    end

  end  
end # Patient pages  
