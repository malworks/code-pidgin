require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { Article.create!(title: "New Article Title", body: "New Article Body") }


  describe "attributes" do
    it "has title and body attributes" do
      expect(article).to have_attributes(title: "New Article Title", body: "New Article Body")
    end
  end
end
