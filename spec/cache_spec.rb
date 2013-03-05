require_relative 'helpers/default'
require_relative '../libraries/cache'


describe 'Helpers::Cache' do
  before(:each) do 
    Fauxhai.mock(platform: 'ubuntu', version: '12.04') do |n|
    end
    @chef_run = ChefSpec::ChefRunner.new
  end

  it 
  it 'should set a key with a value' do 
    Helpers::Cache.set( :foo, "datadata").should eql("datadata")
  end

  it 'should return nil on invlaid get' do
    Helpers::Cache.get(:bar).should eql(nil)
  end

  it 'shold set_if_empty' do
    Helpers::Cache.set_if_empty( :bar, "whee" ).should eql(true)
  end

  it 'should not set if not empty' do 
    Helpers::Cache.set( :bar, "whee" )
    Helpers::Cache.set_if_empty( :bar, "bazz" ).should eql(false)
  end

end
