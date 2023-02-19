file "Create a file" do
    content "<html>This is a placeholder for the home page.</html>"
    group "root"
    mode "0755"
    owner "ec2-user"
    path "/tmp/create_file/index.html"
  end
  
  remote_file '/tmp/copy_file/index.html' do
    source 'file:///tmp/create_file/index.html'
  end