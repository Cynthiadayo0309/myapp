require 'rails_helper'

RSpec.describe Article, type: :model do
    describe "#create" do
        it "titleとcontentが存在すると登録できること" do
            article = build(:article)
            expect(article).to be_valid
        end

        it "titleがない場合は登録できないこと" do
            article = build(:article, title: nil)
            article.valid?
            expect(article.errors[:title]).to include("を入力してください")  
        end

        it "contentがない場合は登録できないこと" do
            article = build(:article, content: nil)
            article.valid?
            expect(article.errors[:content]).to include("を入力してください")
        end
    end
end
