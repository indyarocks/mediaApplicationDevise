require "rails_helper"

RSpec.describe 'Static pages', type: :request do

  subject { page }

  shared_examples_for 'All static pages' do
    it { should have_selector('h1', text: heading)}
    it { should have_title(full_title(page_title))}
  end

  describe 'Home page' do
    before { visit root_path}

    let(:heading) {'Media Application'}
    let(:page_title) { '' }

    describe 'for un-signed users' do
      let(:user){FactoryGirl.create(:user)}

      before do
        FactoryGirl.create(:public_media, user: user, description: 'public-1')
        FactoryGirl.create(:private_media, user: user, description: 'private-1')
        visit root_path
      end

      it "should render only public media post" do
        page.should have_css("div.medias li", :count => 1)

        user.public_medias.each do |media|
          expect(page).to have_selector("li##{media.id}", text: 'public-1')
        end
      end

      it "should not render private media post" do
        page.should_not have_content('private-1')
        user.private_medias.each do |media|
          expect(page).not_to have_selector("li##{media.id}", text: 'private-1')
        end
      end
    end

    describe 'for signed-in user' do

    end
  end

end