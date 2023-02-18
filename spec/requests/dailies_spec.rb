# spec/requests/dailies_spec.rb
require 'rails_helper'

RSpec.describe "Dailies", type: :request do
    let(:user) { create(:user) }

    
    describe "GET /dailies" do
        before { sign_in user }
        it "renders the index template" do
            get dailies_path
            expect(response).to render_template(:index)
        end
    end
    
    describe "GET /dailies/:id" do
        before { sign_in user }
        let(:daily) { create(:daily) }
        
        it "renders the show template" do
            get daily_path(daily)
            expect(response).to render_template(:show)
        end
    end
    
    describe "GET /dailies/new" do
        context "when logged in" do
            before { sign_in user }
            it "renders the new template" do
                get new_daily_path
                expect(response).to render_template(:new)
            end
        end

        context "when not logged in" do
            it "redirects to the sign in page" do
                get new_daily_path
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end

    describe "POST /dailies" do
        let(:category) { create(:category) }
        let(:news_item) { create(:news_item, category: category) }

        before { sign_in(user) }

        # context "with valid parameters" do
        #     let(:daily_params) do
        #         {
        #             daily: {
        #             posted_date: Date.yesterday.strftime("%a, %d %b %Y"),
        #             title: Faker::Lorem.sentence,
        #             content: Faker::Lorem.paragraphs.join("\n\n"),
        #             editor_id: user.id,
        #             news_item_ids: [news_item.id]
        #             }
        #         }
        #     end

        #     it "creates a new daily" do
        #         expect {
        #             before_count = Daily.count
        #             # binding.pry
        #             post dailies_path, params: daily_params
        #             after_count = Daily.count
        #             expect(after_count).to eq(before_count + 1)
        #             }.to change(Daily, :count).by(1)               
                
        #     end

        #     it "redirects to the new daily" do
        #         post dailies_path, params: daily_params
        #         expect(response).to redirect_to(daily_path(Daily.last))
        #     end
        # end

        # context "with invalid parameters" do
        #     let(:daily_params) { { daily: { title: "" } } }

        #     it "does not create a new daily" do
        #         expect {
        #             post dailies_path, params: daily_params
        #         }.not_to change(Daily, :count)
        #     end

        #     it "renders the new template" do
        #         post dailies_path, params: daily_params
        #         expect(response).to render_template(:new)
        #     end
        # end
    end

    # describe "GET /dailies/:id/edit" do
    #     let(:user) { create(:user) }
    #     let(:daily) { create(:daily, editor: user) }

    #     context "when logged in as the editor" do
    #         before { sign_in(user) }

    #         it "renders the edit template" do
    #             get edit_daily_path(daily)
    #             expect(response).to render_template(:edit)
    #         end
    #     end

    #     context "when logged in as a different user" do
    #         let(:other_user) { create(:user) }

    #         before { sign_in(other_user) }

    #         it "redirects to the daily page" do
    #             get edit_daily_path(daily)
    #             expect(response).to redirect_to(daily_path(daily))
    #         end
    #     end

    #     context "when not logged in" do
    #         it "redirects to the sign-in page" do
    #             get edit_daily_path(daily)
    #             expect(response).to redirect_to(new_user_session_path)
    #         end
    #     end
    # end

    # describe "POST /dailies" do
    #     let(:user) { create(:user) }
    #     let(:daily_params) { attributes_for(:daily) }

    #     before { sign_in(user) }

    #     context "with valid parameters" do
    #         it "creates a new daily" do
    #             expect {
    #             post dailies_path, params: { daily: daily_params }
    #             }.to change(Daily, :count).by(1)
    #         end

    #         it "redirects to the created daily" do
    #             post dailies_path, params: { daily: daily_params }
    #             expect(response).to redirect_to(daily_path(Daily.last))
    #         end
    #     end

    #     context "with invalid parameters" do
    #         let(:invalid_params) { attributes_for(:daily, title: nil) }

    #         it "does not create a new daily" do
    #             expect {
    #             post dailies_path, params: { daily: invalid_params }
    #             }.to_not change(Daily, :count)
    #         end

    #         it "renders the new template" do
    #             post dailies_path, params: { daily: invalid_params }
    #             expect(response).to render_template(:new)
    #         end
    #     end
    # end

    # describe "PATCH /dailies/:id" do
    #     let(:user) { create(:user) }
    #     let(:daily) { create(:daily, editor: user) }
    #     let(:new_title) { "New Title" }
    #     let(:new_params) { { title: new_title } }

    #     before { sign_in(user) }

    #     context "with valid parameters" do
    #         it "updates the daily" do
    #             patch daily_path(daily), params: { daily: new_params }
    #             expect(daily.reload.title).to eq(new_title)
    #         end

    #         it "redirects to the updated daily" do
    #             patch daily_path(daily), params: { daily: new_params }
    #             expect(response).to redirect_to(daily_path(daily))
    #         end
    #     end

    #     context "with invalid parameters" do
    #         let(:invalid_params) { { title: nil } }

    #         it "does not update the daily" do
    #             patch daily_path(daily), params: { daily: invalid_params }
    #             expect(daily.reload.title).to_not eq(nil)
    #         end

    #         it "renders the edit template" do
    #             patch daily_path(daily), params: { daily: invalid_params }
    #             expect(response).to render_template(:edit)
    #         end
    #     end

    # end

    # describe "DELETE /dailies/:id" do
    #     let(:user) { create(:user) }
    #     let(:daily) { create(:daily, editor: user) }

    #     before { sign_in(user) }

    #     it "destroys the daily" do
    #         expect {
    #             delete daily_path(daily)
    #         }.to change(Daily, :count).by(-1)
    #     end

    #     it "redirects to the dailies list" do
    #         delete daily_path(daily)
    #         expect(response).to redirect_to(dailies_path)
    #     end        
    # end
end