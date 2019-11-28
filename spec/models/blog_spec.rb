require 'rails_helper'

RSpec.describe Blog, type: :model do
	subject{ 
		described_class.new(title: "something", body: "something something", topic_id: "1")
	}
	it "Blog is valid with valid attributes" do
		expect(subject).to be_valid
	end
	it "Blog is not valid without a title" do 
		subject.title = nil
		expect(subject).to_not be_valid
	end
	it "Blog is not valid without a body" do 
		subject.body = nil
		expect(subject).to_not be_valid
	end
	it "Blog is not valid without a topic" do
		subject.topic_id = nil
		expect(subject).to_not be_valid
	end

	describe "Associations" do
		it "has many comments" do
			com = described_class.reflect_on_association(:comments)
			expect(com.macro).to eq :has_many
		end
		it "belongs to topic" do
			com = described_class.reflect_on_association(:topic)
			expect(com.macro).to eq :belongs_to
		end
		# it { should have_many(:comments) }
	end
end