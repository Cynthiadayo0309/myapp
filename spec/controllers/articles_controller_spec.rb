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

    describe "#edit" do
        before do
            @user = create(:user)
            @article = create(:article)
        end
        
        it "responds successfully" do
            get :edit, params: {id: @article.id}
            expect(response).to be_success  
        end

        it "returns a 200 response" do
            get :edit, params: {id: @article.id}
            expect(response).to have_http_status "200"
        end
    end

    describe "#update" do
        before do
            @user = create(:user)
            @article = create(:article)
        end

        context "as an authorized user" do
        
            it "updates an article" do
                article_params = {title: "こんにちは"}
                patch :update, params: {id: @article.id, article: article_params}
                expect(@article.reload.title).to eq "こんにちは"  
            end

            it "redirects the page to /articles/article.id(1)" do
                article_params = {title: "こんにちは"}
                patch :update, params: {id: @article.id, article: article_params}
                expect(response).to redirect_to "/articles/1"
            end
        end

        context "with invalid attributes" do
            # 不正なアトリビュートを含む記事は更新できなくなっているか？
            it "does not update an article" do
              article_params = {title: nil}
              patch :update, params: {id: @article.id, article: article_params}
              expect(@article.reload.title).to eq "test"
            end
        end
    end
    
end