defmodule DrawSomething.Dictionary.CrawlerTest do
  use ExUnit.Case
  alias DrawSomething.Dictionary.Crawler


  test "initialisation with correct words" do
    assert {:ok, pid} = Crawler.start_link 0, 1
    assert Crawler.words(pid) == ["bob", "bobby"]
  end

  test "initialise via supervisor" do
    assert {:ok, pid} = Crawler.Supervisor.start_crawler 0, 1
    assert Crawler.words(pid) == ["bob", "bobby"]
  end

  test "has correct range" do
    assert {:ok, pid} = Crawler.Supervisor.start_crawler 0, 1
    assert Crawler.range(pid) == 0..1
  end

  test "find all possible words" do
    assert {:ok, pid} = Crawler.Supervisor.start_crawler 0, 1
    assert Crawler.find_all_possible_words(pid, "bob") == ["bob"]
    assert Crawler.find_all_possible_words(pid, "bybob") == ["bob", "bobby"]
  end




end
