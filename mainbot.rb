require 'discordrb'

bot = Discordrb::Bot.new token: 'FUCK U'
botprefix='d!'
bot.message(with_text: botprefix+'ping') do |event|
  m = event.respond('Pong!')
  ts = "#{Time.now - event.timestamp}".to_f
  ts = ts * 1000
  ts= ts.to_i
  ts = ts.to_s
  m.edit "Pong! Time taken: "+ts+" ms."
end
bot.message(start_with: botprefix+'warn') do |event|
  arr = event.message.mentions
  first = arr[0] #извлечь самое первое упоминание
  a = event.content
  if first
    event.message.delete
    if a[29, a.length+1]
      event.bot.user(first.id).pm('Ты был заварнен по причине "'+a[29, a.length+1]+'"')
      event.message.channel.start_typing
      event.respond('Успешно заварнен по причине "'+a[29, a.length+1]+'"')
    else
      event.bot.user(first.id).pm('Ты был заварнен')
      event.message.channel.start_typing
      event.respond('Успешно Заварнен без причины') end
  else event.respond("А призвать кого-нибудь?") end
end
bot.message(with_text: botprefix+'ping') do |event|
  event.message.delete
end
bot.message(with_text: botprefix+"help") do |event|
event.channel.send_embed do |embed|
  embed.title = "Список доступных команд"
  embed.colour = 0x2ad332
  embed.description = "Префикс бота - d!"
  embed.timestamp = Time.now
  embed.add_field(name: "ping", value: "Посмотреть задержку бота")
  embed.add_field(name: "help", value: "Список доступных команд")
  embed.add_field(name: "warn (еще разрабатывается, но уже в рабочем состоянии)", value: "Выдать предупреждение пользователю")
  embed.add_field(name: "say", value: "Сказать что-нибудь")
  embed.add_field(name: "afk", value: "Встать в АФК")
  embed.add_field(name: "unafk", value: "Выйти из АФК")
  embed.add_field(name: "games", value: "Список доступных игр")
  embed.add_field(name: "avatar (в разработке)", value: "Показать Аватар пользователя (пока только свой)")
  embed.add_field(name: "logo", value: "Показать иконку сервера")
  embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "requested by #{event.user.name}", icon_url: "#{event.user.avatar_url}")
end
end
bot.message(start_with: botprefix+"say") do |event|
  event.message.channel.start_typing
  a = event.content
  event.message.delete
  event.respond(a[5, a.length+1])
end
bot.message(with_text: botprefix+"закреп") do |event|
  m = event.respond "закреп"
  m.pin
  m.unpin
end
bot.message(with_text: botprefix+"4ek") do |event|
  a = event.message.webhook?
  if a == true
     event.respond "Да"
   end
  if a == false
    event.respond "Нет"
  end
end
bot.message(with_text: botprefix+"afk") do |event|
  a = event.user.name
  event.channel.send_embed do |embed|
    embed.title = a+" отошёл"
    embed.colour = 0x2ad332
    embed.timestamp = Time.now
    embed.thumbnail = Discordrb::Webhooks::EmbedImage.new(url: " https://images-ext-1.discordapp.net/external/bHgCJDB7OagguZl0LsM3KG2doxboqtrGCew1Mbc-saA/%3Fwidth%3D80%26height%3D80/https/images-ext-1.discordapp.net/external/zOQcnhsC7Ud8tPF-pJQpt51YyrvvP-xwH5c9v02p4Ys/https/thumbs.gfycat.com/SinfulCompetentBeaver-max-1mb.gif")
  end
end
bot.message(with_text: botprefix+"unafk") do |event|
  event.message.delete
  a = event.user.name
  event.channel.send_embed do |embed|
    embed.title = a+" пришел"
    embed.colour = 0x2ad332
    embed.timestamp = Time.now
    embed.image = Discordrb::Webhooks::EmbedImage.new(url: "https://icdn.lenta.ru/images/2016/08/10/18/20160810185410412/pic_e7774631b9f5679750e1d1ca1d9f0458.png")
  end
end
counter = 0
bot.message(with_text: botprefix+"count") do |event|
  counter += 1
  event.respond(counter)
end
bot.message(with_text: botprefix+"games") do |event|
  event.channel.send_embed do |embed|
    embed.add_field(name: "count", value: "Странная игра, созданная для теста")
  end
end
bot.message(with_text: botprefix+'avatar') do |event|
  event.channel.send_embed do |embed|
    event.message.delete
    embed.title = "Аватар пользователя:"
    embed.colour = 0xef5c0
  embed.image = { url: event.user.avatar_url }
end
end
bot.message(with_text: botprefix+"hm") do |event|
  event.respond "⠀⠰⡿⠿⠛⠛⠻⠿⣷
⠀⠀⠀⠀⠀⠀⣀⣄⡀⠀⠀⠀⠀⢀⣀⣀⣤⣄⣀⡀
⠀⠀⠀⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⠛⠛⣿⣿⣿⡛⠿⠷
⠀⠀⠀⠀⠀⠘⠿⠿⠋⠀⠀⠀⠀⠀⠀⣿⣿⣿⠇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁

⠀⠀⠀⠀⣿⣷⣄⠀⢶⣶⣷⣶⣶⣤⣀
⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠈⠙⠻⠗
⠀⠀⠀⣰⣿⣿⣿⠀⠀⠀⠀⢀⣀⣠⣤⣴⣶⡄
⠀⣠⣾⣿⣿⣿⣥⣶⣶⣿⣿⣿⣿⣿⠿⠿⠛⠃
⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡁
⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁
⠀⠀⠛⢿⣿⣿⣿⣿⣿⣿⡿⠟
⠀⠀⠀⠀⠀⠉⠉⠉"
end
bot.message(start_with: botprefix+"logo") do |event|
      event.channel.send_embed do |embed|
      event.message.delete
      embed.title = "Аватар сервера"
      embed.colour = 0xef5c0
      embed.image = { url: event.server.icon_url }
    end
end
bot.message(start_with: botprefix+"mute") do |event|
  event.respond 'жду'
  sleep 3
  event.message.delete
  event.respond 'дождался'
end
bot.message(with_text: botprefix+"testrnd") do |event|
  i = event.content
  arr = i[11, i.length-2]; i[13, i.length+1]
r = Random.rand(arr[0]...arr[1])
event.respond r
end
bot.run
