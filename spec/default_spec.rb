require 'spec_helper'

describe 'ruby-versions::default' do
  
  let(:chef_run) do
    runner = ChefSpec::Runner.new
    runner.converge('ruby-versions::default')
  end

  it 'retrieves hellobits key and adds to apt' do
    expect(chef_run).to run_execute "wget -O - http://apt.hellobits.com/hellobits.key | sudo apt-key add -"
  end

  it 'echoes' do
    expect(chef_run).to run_execute "echo 'deb http://apt.hellobits.com/ precise main' | sudo tee /etc/apt/sources.list.d/hellobits.list"
  end

  it "updates apt" do
    expect(chef_run).to run_execute "apt-get -y update"
  end

  describe "installing ruby" do

    context "when ruby version is 1.9" do

      let(:chef_run) do
        ChefSpec::Runner.new do |node|
          node.set['ruby']['version'] = '1.9'
        end.converge('ruby-versions::default')
      end

      it "installs ruby 1.9" do
        expect(chef_run).to run_execute "apt-get install -y ruby-ichi"
      end
      
    end

    context "when ruby version is 2.0" do

      let(:chef_run) do
        ChefSpec::Runner.new do |node|
          node.set['ruby']['version'] = '2.0'
        end.converge('ruby-versions::default')
      end

      it "installs ruby 2.0" do
        expect(chef_run).to run_execute "apt-get install -y ruby-ni"
      end

    end

    context "when ruby version is 2.1" do

      let(:chef_run) do
        ChefSpec::Runner.new do |node|
          node.set['ruby']['version'] = '2.1'
        end.converge('ruby-versions::default')
      end

      it "installs ruby 2.1" do
        expect(chef_run).to run_execute "apt-get install -y ruby-2.1"
      end

    end

  end

  it "installs dependent libraries" do
    expect(chef_run).to run_execute "apt-get install -y autoconf automake bison libc6-dev libffi-dev libreadline6 libreadline6-dev libsqlite3-dev libssl-dev libtool libxml2-dev libxslt-dev libxslt1-dev libyaml-dev ncurses-dev sqlite3 zlib1g zlib1g-dev"
  end

  it "updates system gems" do
    expect(chef_run).to run_execute "gem update --system"
  end

  it "installs bundler" do
    expect(chef_run).to run_execute "gem install bundler --no-ri --no-rdoc"
  end

end