require 'spec_helper'

describe SimpleCovChecker do
  it 'has a version number' do
    expect(SimpleCovChecker::VERSION).not_to be nil
  end

  describe "initialization" do
    it 'blows up with invalid option' do
      expect{ SimpleCovChecker.new(foo: "borken") }.to raise_error(ArgumentError)
    end

    it 'accepts source_path option' do
      expect{ SimpleCovChecker.new(source_path: "valid_path") }.not_to raise_error
    end

    it 'accepts resultset_path option' do
      expect{ SimpleCovChecker.new(resultset_path: "valid_path") }.not_to raise_error
    end
  end

  describe "standard instance" do
    subject { SimpleCovChecker.new(source_path: 'spec/fixtures/app', resultset_path: 'spec/fixtures/coverage') }

    it 'returns a file while is never loaded' do
      expect(subject.missed_files).to eq %w(spec/fixtures/app/models/uncovered.rb)
    end
  end
end
