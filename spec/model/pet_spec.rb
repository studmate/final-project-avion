require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { expect(described_class.new).to validate_presence_of :name }
  it { expect(described_class.new).to validate_presence_of :specie }
  it { expect(described_class.new).to validate_presence_of :breed }
  it { expect(described_class.new).to validate_presence_of :birthdate }
  it { expect(described_class.new).to validate_presence_of :age }
end