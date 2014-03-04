require 'spec_helper'


describe "Doctor pages" do

  subject { page }

  describe "for non-signed-in users" do
    describe "visiting Doctor list view" do
      before { visit doctors_path }
      it { should have_title(_('Sign in')) }
    end # visiting Doctor List view
  end # for non-signed-in users

  describe "for signed-in users" do
    describe "List view" do
      let(:mc)     { FactoryGirl.create(:medical_center) }
      let(:user)   { FactoryGirl.create(:user, medical_center: mc) }
      let(:doctor) { FactoryGirl.create(:doctor, medical_center: mc) }
      before do
        sign_in user
        visit doctors_path
      end
      
      describe "searching" do
        it { should have_selector('button.btn') }
      end
            
      describe "pagination" do
        before(:all) { 30.times { FactoryGirl.create(:doctor) } }
        after(:all) { Doctor.delete_all }
        
        it "should list each user" do
          Doctor.paginate(page: 1).each do |user|
            expect(page).to have_selector('td', text: doctor.name)  
            expect(page).to have_selector('td', text: doctor.phone_number)  
            expect(page).to have_selector('td', text: doctor.email)  
          end # Doctor.paginate
        end  # should list each user
      end # pagination
    end # List view
  end # for signed-in users




  describe "doctor creation" do 
    let(:mc)     { FactoryGirl.create(:medical_center) }
    let(:user)   { FactoryGirl.create(:user, medical_center: mc) }
    let (:submit) { _('New Doctor') }
    
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
end # Doctor pages  
