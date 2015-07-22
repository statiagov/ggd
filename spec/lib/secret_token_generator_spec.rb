# Copyright (c) 2008-2014 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

require 'spec_helper'
require 'statia_gov/secret_token_generator'

describe StatiaGov::SecretTokenGenerator do
  let(:token) { 'e5a4b315c062dec4ecb40dabcde84fd6c067cb016a813702d2f4299ad16255c88ed1020bd47fb527e8e5f7052b04be1fbb8e63c043b8fb36f88d3c7d79a68681' }

  describe "setup!" do
    it "should not generate a new token if one exists" do
      allow(StatiaGov::SecretTokenGenerator).to receive(:token_exists?).and_return(true)
      expect(StatiaGov::SecretTokenGenerator).not_to receive(:new_token!)
      StatiaGov::SecretTokenGenerator.setup!
    end

    it "should generate a token if none exists" do
      allow(StatiaGov::SecretTokenGenerator).to receive(:token_exists?).and_return(false)
      expect(StatiaGov::SecretTokenGenerator).to receive(:new_token!)
      StatiaGov::SecretTokenGenerator.setup!
    end

    it "should generate a random token if not persisted" do
      allow(StatiaGov::SecretTokenGenerator).to receive(:token_exists?).and_return(false)
      allow(StatiaGov::SecretTokenGenerator).to receive(:new_token)
      expect(StatiaGov::SecretTokenGenerator).to receive(:generate_token).exactly(:twice)
      StatiaGov::SecretTokenGenerator.setup!
    end
  end

  describe "token_exists?" do
    it "should be true" do
      allow(Setting).to receive(:secret_token).and_return(token)
      expect(StatiaGov::SecretTokenGenerator.send(:token_exists?)).to eql(true)
    end

    it "should be false" do
      allow(Setting).to receive(:secret_token).and_return(nil)
      expect(StatiaGov::SecretTokenGenerator.send(:token_exists?)).to eql(false)
    end
  end

  describe "token" do
    it "should delegate to Setting" do
      expect(Setting).to receive(:secret_token).and_return(token)
      expect(StatiaGov::SecretTokenGenerator.send(:token)).to eql(token)
    end
  end

  describe "new_token!" do
    it "should generate and set a new token" do
      expect(StatiaGov::SecretTokenGenerator).to receive(:generate_token).and_return(token)
      expect(Setting).to receive(:secret_token=).with(token)
      StatiaGov::SecretTokenGenerator.send(:new_token!)
    end
  end

  describe "generate_token!" do
    it "should generate a random token" do
      expect(SecureRandom).to receive(:hex).with(64).and_return(token)
      StatiaGov::SecretTokenGenerator.send(:generate_token)
    end
  end
end
