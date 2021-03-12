require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    describe "#index" do
        it "responds successfully" do
            get :index
            expect(response).to be_success
        end

        it "returns a 200 response" do
            get :index
            expect(response).to have_http_status "200"
        end
    end

    describe "#new" do
        it "responds successfully" do
            get :new
            expect(response).to be_success
        end

        it "returns a 200 response" do
            get :new
            expect(response).to have_http_status "200"
        end
    end

    describe "#show" do
        before do
          @user = create(:user)
          @article = create(:article)
        end
        it "responds successfully" do
          get :show, params: {id: @article.id}
          expect(response).to be_success
        end
        it "returns a 200 response" do
          get :show, params: {id: @article.id}
          expect(response).to have_http_status "200"
        end
    end
end