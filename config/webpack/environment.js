const { environment } = require('@rails/webpacker')
const jquery = require('./plugins/jquery')

const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
// const webpack = require('webpack')
// environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
//   $: 'jquery/src/jquery',
//   jQuery: 'jquery/src/jquery',
//   jquery: 'jquery',
//   'window.jQuery': 'jquery',
//   Popper: ['popper.js', 'default']
// }))
// const webpack = require('webpack')
// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery'
//   })
// )

environment.plugins.prepend('jquery', jquery)
module.exports = environment
