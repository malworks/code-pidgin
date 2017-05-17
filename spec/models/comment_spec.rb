require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:article) { Article.create!(title: "New Article Title", body: "New Article Body") }
  let(:comment) { Comment.create!(body: 'Comment Body', article: article) }

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  endend
