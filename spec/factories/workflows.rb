FactoryGirl.define do
  factory :workflow do |f|
    f.name "Test"
    f.tags ["foo", "bar"]
    f.wdl_source "task hello {\r\n  String name\r\n\r\n  command {\r\n    echo 'hello ${name}!'        \r\n  }\r\n\r\n  output {\r\n    File response = stdout()        \r\n  }\r\n}\r\n\r\nworkflow test {\r\n  call hello \r\n}\r\n"
    f.options {}
  end
end
