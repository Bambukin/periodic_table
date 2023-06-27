# frozen_string_literal: true

require 'json'

system 'clear'

table = JSON.parse(File.read("#{__dir__}/table.json"), symbolize_names: true)

puts "У нас есть #{table.size} элементов:"
puts table.keys.join(', ')
puts 'О каком элементе хотите узнать?'
user_choice = $stdin.gets.chomp.capitalize.to_sym

if table.key?(user_choice)
  element = table[user_choice]
  element.default = '---'

  puts <<~DESCRIPTION
    Название: #{element[:name]}
    Порядковый номер: #{element[:number]}
    Первооткрыватель: #{element[:discoverer]} (#{element[:year]})
    Плотность: #{element[:density]} г/см³
  DESCRIPTION
else
  puts 'Извините, про такой элемент мы еще не знаем.'
end
