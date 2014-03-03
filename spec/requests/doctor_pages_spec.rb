require 'spec_helper'


describe "Doctor pages" do

  subject { page }

  describe "for non-signed-in users" do
    describe "visitin Doctor list view" do
      before { visit doctors_path }
      
      it { should have_title(_('Sign in')) }
    end # visit Doctor List view
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

end # Doctor pages  
