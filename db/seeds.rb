# frozen_string_literal: true

puts 'Clearing data...'

User.destroy_all

puts 'Creating users...'
sophie, margot, leo, lampo = User.create! [
  { first_name: 'sophie', street: 'white chair', number: '39', city: 'traffiume', postcode: '28822', country: 'italia' },
  { first_name: 'margot', street: 'red couch', number: '32', city: 'intra', postcode: '22882', country: 'italia' },
  { first_name: 'leo', last_name: 'leone', street: 'outdoor bench', number: '33', city: 'cannobio', postcode: '82822', country: 'italia' },
  { first_name: 'lampo', last_name: 'lampone', street: 'blue couch', number: '41', city: 'valle', postcode: '28282', country: 'italia' }
]

puts 'Creating posts...'
first_sophie_post, *, second_sophie_post = Post.create! [
  { body: 'Ho mangiato troppo.', user: sophie },
  { body: 'Sono piccolo e carino.', user: lampo },
  { body: 'Non ho più un occhio.', user: leo },
  { body: 'Ho mangiato tantissimo.', user: sophie }
]

puts 'Creating comments...'
Comment.create! [
  { body: "Sei un'obesa!", user: lampo, post: first_sophie_post },
  { body: 'Io no.', user: margot, post: second_sophie_post },
  { body: 'Forse hai esagerato...', user: leo, post: first_sophie_post },
  { body: 'Quanto hai mangiato?', user: margot, post: first_sophie_post }
]

puts 'Done!'
