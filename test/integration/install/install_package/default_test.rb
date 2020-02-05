title "vim package installation integration tests"

case os[:family]
when "redhat"
  describe package('vim-enhanced') do
    it { should be_installed }
  end
when "debian"
  describe package('vim') do
    it { should be_installed }
  end
else
  raise "Unsupported OS family!"
end
