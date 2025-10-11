const path = require('path');
const webpack = require('webpack')
const TerserPlugin = require('terser-webpack-plugin')

module.exports = {
  mode: 'none', /* set by cli */
  entry: {
    media: path.resolve(__dirname, './media.js'),
    player_download: path.resolve(__dirname, './player_download.js'),
    snow: path.resolve(__dirname, './snow.js'),
  },
  output: {
    path: path.resolve(__dirname, '../content/js'),
    filename: '[name].[contenthash:10].js',
    clean: true,
  },
  plugins: [
    new webpack.BannerPlugin({
      banner: `EasyRPG.org javascript, bundled by webpack - https://webpack.js.org
For license information visit <%= @config[:base_url] + @items['/about/website.*'].path %>
`,
    }),
  ],
  optimization: {
    minimizer: [new TerserPlugin({
      extractComments: false,
    })],
    //runtimeChunk: 'single',
    splitChunks: {
      cacheGroups: {
        commons: {
          name: 'commons',
          chunks: 'initial',
          minChunks: 2,
          filename: '[name].[contenthash:10].js',
        },
      },
    },
  },
};
