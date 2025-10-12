const path = require('path');
const webpack = require('webpack')
const TerserPlugin = require('terser-webpack-plugin')
const CopyPlugin = require("copy-webpack-plugin");

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
    new CopyPlugin({
      patterns: [
        { context: 'node_modules/', from: 'glightbox/dist/css/glightbox.css',
          to: path.resolve(__dirname, '../content/css/vendor') },
      ],
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
