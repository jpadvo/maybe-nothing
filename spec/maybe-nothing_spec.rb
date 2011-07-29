require File.dirname(__FILE__) + '/../lib/maybe-nothing.rb'

describe '@non_nil.maybe' do

  before :each do
    @non_nil = Object.new
  end

  describe '.get' do
    it 'should return @non_nil' do
      @non_nil.maybe.get.should equal @non_nil
    end
  end
  
  describe '.present?' do
    it 'should return true' do
      @non_nil.maybe.present?.should equal true
    end
  end
  
  describe '.blank?' do
    it 'should return false' do
      @non_nil.maybe.blank?.should equal false
    end
  end
  
end

describe 'nil.maybe' do

  describe '.get' do
    it 'should raise an exception' do
      lambda{nil.maybe.get}.should raise_exception('MaybeNothing::None::Unwrapped')
    end
  end
  
  describe '.present?' do
    it 'should return false' do
      nil.maybe.present?.should equal false
    end
  end
  
  describe '.blank?' do
    it 'should return true' do
      nil.maybe.blank?.should equal true
    end
  end
  
end