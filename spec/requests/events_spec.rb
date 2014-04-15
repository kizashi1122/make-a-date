# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Events" do

  subject { page }
  
  describe "Home" do
    before { visit root_path }
    it { should have_content("イベント作成") }

    describe "Create Event" do
      before do
        fill_in "イベント名",        with: "Some Event"
        fill_in "詳細", with: "Place is blah blah blah.. Url is blah blah"
        fill_in "候補日時",        with: "1\n2\n3\n\n"
      end

      describe "with valid information" do
        subject { -> { click_button "イベント作成" } }
        it { should change( Event, :count ).by(1) }
        it { should change( Plan, :count  ).by(3) }
      end

      describe "with invalid information" do
        before do
          fill_in "イベント名", with: ""
          click_button "イベント作成"
        end
        it { should have_content("error") }
      end
    end
  end

end
