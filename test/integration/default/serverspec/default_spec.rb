require 'spec_helper'

describe 'Users' do
  %w(
    eherot
    jeff
  ).each do |username|
    describe user username do
      it { is_expected.to exist }
      it { is_expected.to belong_to_group 'evertrue' }
      it { is_expected.to belong_to_group 'sysadmin' }
      it { is_expected.to have_home_directory "/home/#{username}" }
      it { is_expected.to have_login_shell '/bin/bash' }
    end

    %w(
      .aliases
      .bash_profile
      .bash_prompt
      .functions
    ).each do |dotfile|
      describe file "/home/#{username}/#{dotfile}" do
        it { is_expected.to be_file }
        it { is_expected.to be_owned_by username }
        it { is_expected.to be_mode '600' }
      end
    end

    describe file "/home/#{username}/.exports" do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by username }
      it { is_expected.to be_mode '600' }
      describe '#content' do
        subject { super().content }
        it { is_expected.to include 'export BUNDLE_GEM__FURY__IO=aaaaaaaaaaaaaaaaaaaa' }
      end
    end
  end

  keys_h = {
    'jeff' => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDWFaS+41vUMTaKeDFYH8+HU9iP1UWHUQbaTISquwjulRJRuV3UfQ8qbKPQ3sdw8VORXlKCOX+n77YZirj1S5fmuQZBR914anakUFfadepi9n28wCckSDyxiBJNLfzSsJlZRfKmUbJounf9vXuv+gBEmJbxhb0l2FjchtDo1YrsJ1AYq3b5HYgd0FOWTjymc4XoDLkoW9lRtIYeQ3CFWMmg3TvN17swJihZ7dq3SdjB5BzkIIIflg7f0oAImLff/9QJcDdC5CsLKNst3OXw1XhI2okjirx3wCKXmTTDsVs8AkSpqE9gxG3A8kFNVN4mIK6g0V56lu7UV0NeZ2ZfjehB jeff@evertrue.com',
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwyFoIvTFlT1ODyExMwCfsq7/iweGb+VWDjeti4l5cA6ATVfvpp6+U49jNSa75U3xKarZHiISFkpRx7AjX16eEY5f7yy5E1ntoHf1T8jhqIQ8/FG2S2XYD8hfnGYLLavLWpm0nhGLOjHbDSfMtcFPsARhGwqK7fC2vSKWUykQGPrg2YkToIino31qAj826B4Z/4RzcjDIa7MUidC0tRVAdE8VUL+jOyvZaL0HNKUmua1SxxXJbSfCaioDUk2gyBxxQZqDfcYsR24GTNo77wmmsxgCLX0AZchTATNGnN76CxhH5ze+yQLX9NIgzw/O5vO0a45qtbu75hd3xuPXWtgah jeff@jeffbyrn.es'
    ],
    'eherot' => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYlIGqnhpfi1HhzvBZrlSm4Fpc2RK9YRxZtKt7E1mZJFcEsZmt3vjuLqBSeYPF8z6Bj/XuCKrlLx0N88tjOsv6mEAvKG+472LMnlmkT7uB0m+WDhEUOyOAwVHipSOPZ+yRvQfyA9eqvgamiHj5JkumcEeMdoROrwqqzkgI3M1rZzE39gMSEYN2NC6F1aP5g2TXiqXHsSzsGbhY3K55cPFwquqwzCzmSGSU9aCbFzuLWVEQ54pKcWUcDkruhFN/YIvr7dWiKacBdUcGdhiA+49AkVyTGK0qkkvjzjmydvVOf220CDoNzHS207aVReMAO230E0nT5xQEZKFIiGAW+e7L eric.herot@Kats-MacBook-Pro.local'
    ]
  }

  %w(jeff eherot).each do |username|
    describe user username do
      keys_h[username].each { |key| it { is_expected.to have_authorized_key key } }
    end
  end

  describe user 'deploy' do
    keys_h.each do |_username, keys|
      keys.each { |key| it { is_expected.to have_authorized_key key } }
    end
    it { is_expected.to_not have_authorized_key 'should_not_be_here' }
  end

  %w(
    aliases
    bash_profile
    bash_prompt
    exports
    functions
  ).each do |dotfile|
    describe file "/root/.#{dotfile}" do
      it { is_expected.to be_file }
      it { is_expected.to be_mode '644' }
    end
  end
end
