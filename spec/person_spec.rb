require 'spec_helper'
require_relative '../lib/Person'

describe Person do
  describe "#young?" do
    context "is young" do
      let(:person) { Person.new(age: 16) }
      
      it "is true" do
        expect( person.young? ).to be_truthy
      end
    end
  end

  describe "#old?" do
    context "is old" do
      let (:person) { Person.new(age: 105) }

      it "is true" do 
        expect( person.old? ).to be_truthy
      end
    end
  end
  
  describe "#when_is_user_is_75" do
    context "when user is under 75" do
      let (:person_45) { Person.new(age: 45) }

      it "is true" do
        expect( person_45.when_is_user_is_75 ).to eq("You'll be 75 in 30 years.")
      end
    end
  end

  describe "#when_is_user_is_75" do
    context "When user is 75" do
      let (:person_75) { Person.new(age: 75) }

      it "is true" do
        expect ( person_75.when_is_user_is_75 ).to eq("You're 75!!!!")
      end
    end
  end
  
  describe "#when_is_user_is_75" do
    context "when user is over 75" do
      let (:person_105) { Person.new(age: 105) }

      it "is true" do
        expect( person_105.when_is_user_is_75 ).to eq("You turned 75 30 years ago.")
      end
    end
  end
end