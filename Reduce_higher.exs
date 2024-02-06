defmodule ReduceH do

  def length(list) do
    f = fn(_, acc)-> acc+1 end
    reducel(list, 0, f)
  end

  def odd(list) do
    f = fn(x)-> rem(x,2)===1 end
    filter(list, f)
  end

  def even(list) do
    f = fn(x)-> rem(x,2)===0 end
    filter(list, f)
  end

  def inc(list) do
    f = fn(x)-> x+1 end
    map(list, f)
  end

  def dec(list) do
    f = fn(x)-> x-1 end
    map(list, f)
  end

  def mul(list, k) do
    f = fn(x)-> x*k end
    map(list, f)
  end

  def divi(list, k) do
    f = fn(x)-> x/k end
    map(list, f)
  end

  def remainder(list, k) do
    f = fn(x)-> rem(x, k) end
    map(list, f)
  end

  def sum(list) do
    f = fn(x, y)-> y+x end
    reducel(list, 0, f)
  end

  def prod(list) do
    f = fn(x, y)-> y*x end
    reducel(list, 1, f)
  end

  def map([], _) do [] end
  def map([h|t], f) do
    [f.(h)| map(t,f)]
  end

  def reducel([], acc, _) do acc end
  def reducel([h|t], acc, f) do
    reducel(t, f.(h, acc), f)
  end

  def reducer([], acc, _) do acc end
  def reducer([h|t], acc, f) do
    f.(h, reducer(t, acc, f))
  end

  def filter([], _) do [] end
  def filter([h|t], f) do
    if f.(h) do
      [h|filter(t, f)]
    else
      filter(t, f)
    end
  end

  def test(lst, n) do
    lst|>
    filter(fn(x)->x <= n end)|>
    map(fn(x)->x*x end)|>
    reducel(0, fn(x,y)->x+y end) end
end
