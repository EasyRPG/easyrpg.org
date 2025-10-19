const path = require('path');
const webpack = require('webpack')
const TerserPlugin = require('terser-webpack-plugin')

module.exports = {
  mode: 'none', /* set by cli */
  entry: {
    media: path.resolve(__dirname, './scripts/media.js'),
    player_download: path.resolve(__dirname, './scripts/player_download.js'),
    snow: path.resolve(__dirname, './scripts/snow.js'),
    style: path.resolve(__dirname, './styles/easyrpg.scss'),
  },
  output: {
    path: path.resolve(__dirname, '../content/static'),
    filename: 'js/[name].[contenthash:10].js',
    clean: true,
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: [],
      },
      {
        test: /\.s[ac]ss$/i,
        exclude: /node_modules/,
        type: "asset/resource",
        generator: {
          filename: "css/[name].[contenthash:10].css",
        },
        use: [
          {
            loader: "sass-loader",
            options: {
              sassOptions: {
                style: process.env.NODE_ENV !== "production" ? "expanded" : "compressed",
              },
            },
          },
        ],
      },
    ],
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
          filename: 'js/[name].[contenthash:10].js',
        },
      },
    },
  },
};
