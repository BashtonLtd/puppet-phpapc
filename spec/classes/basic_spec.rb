require 'spec_helper'

describe 'phpapc' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "phpapc class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('phpapc::params') }

        it { should contain_class('phpapc::install').that_comes_before('phpapc::config') }
        it { should contain_class('phpapc::config') }
        it { should contain_file('/etc/php.d/apc.ini') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'phpapc class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
