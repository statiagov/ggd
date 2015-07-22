
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatiaGov::CommentExtensions do
  # describe "add_comment_by_user" do
  #   let(:user) { FactoryGirl.create(:user) }
  #
  #   before :each do
  #     build_model(:commentable_entity) do
  #       string :subscribed_users
  #       serialize :subscribed_users, Set
  #
  #       acts_as_commentable
  #       uses_comment_extensions
  #     end
  #   end
  #
  #   it "should create a comment for user" do
  #     entity = CommentableEntity.create
  #     entity.add_comment_by_user("I will handle this one", user)
  #     expect(entity.reload.comments.map(&:comment)).to include("I will handle this one")
  #   end
  #
  #   it "should not create a comment if body is blank" do
  #     entity = CommentableEntity.create
  #     entity.add_comment_by_user("", user)
  #     expect(entity.reload.comments).to be_empty
  #   end
  # end
end
