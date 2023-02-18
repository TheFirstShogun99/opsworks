# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'opsworks-demo-webserver'

# The cookbooks directory is the preferred source for external cookbooks
default_source :chef_repo, "cookbooks/" do |s|
  s.preferred_for "nginx", "windows", "chef-client", "yum-epel", "seven_zip", "ssh-hardening",
                  "build-essential", "mingw", "ohai", "audit", "logrotate", "cron"
end

# Alternative source 
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list  'chef-client',
          'opsworks-webserver',
          'audit'
# add 'ssh-hardening' to your runlist to fix compliance issues detected by the ssh-baseline profile

# Specify a custom source for a single cookbook:
cookbook 'opsworks-webserver', path: 'site-cookbooks/opsworks-webserver'

# Policyfile defined attributes

# Define audit cookbook attributes
default["opsworks-demo"]["audit"]["reporter"] = "chef-server-automate"
default["opsworks-demo"]["audit"]["profiles"] = [
  {
    "name": "DevSec SSH Baseline",
    "compliance": "admin/ssh-baseline"
  }
]
