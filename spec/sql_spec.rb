require 'rspec'
require 'sql'

describe 'select' do
  it 'can select from table' do
    SQL.select.from('table').to_s.should == "SELECT (*) FROM table"
  end

  it 'can select fields' do
    SQL.select(["a", "b"]).from('table').to_s.should == "SELECT (a, b) FROM table"
  end
end

describe 'where' do
  it 'can filter fields with AND' do
    SQL.select(["a", "b"]).
      from('table').
      where(foo: :bar, baz: :moo).
      to_s.should ==
    "SELECT (a, b) FROM table WHERE (foo=bar AND baz=moo)"
  end

  it 'can filter fields with OR' do
    SQL.select(["a", "b"]).
      from('table').
      where(foo: :bar, baz: :moo).or(me: :too, you: :should).
      to_s.should ==
    "SELECT (a, b) FROM table WHERE (foo=bar AND baz=moo) OR (me=too AND you=should)"
  end
end


describe 'delete' do
  it 'can delete from table' do
    SQL.delete.from('table').to_s.should == "DELETE FROM table"
  end
end

describe 'insert' do
  it 'can insert into a table' do
    SQL.insert.into('table').values(foo: :f, bar: :b).to_s.should ==
     "INSERT INTO table (foo, bar) VALUES (f, b)"
  end
end

describe 'update' do
  it 'can update a table' do
    SQL.update('table').set(foo: :f, bar: :b).where(you: :know).to_s.should ==
    "UPDATE table SET (foo=f, bar=b) WHERE (you=know)"
  end
end
