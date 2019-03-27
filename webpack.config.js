// webpack.config.js
var webpack = require('webpack');

module.exports = {
  entry: {
    application: ['./assets/javascript/site.js',
           './assets/stylesheets/site.scss']
 
  },
  module: {
    rules: [
      // ...
      {
        test: /\.scss$/,
        use: [
                "style-loader", // creates style nodes from JS strings
                "css-loader", // translates CSS into CommonJS
                "sass-loader" // compiles Sass to CSS, using Node Sass by default
            ]
      },
      // Load plain-ol' vanilla CSS
      { test: /\.css$/, use: "css-loader" },
    ],
    /*rules: [
      {
        test: /\.scss$/,
          use: [
            'css-loader',
            {
              loader: 'postcss-loader',
              options: {
                plugins: function() {
                  return [
                    require('autoprefixer'),
                  ]
                }
              }
            },
            'sass-loader'
          ]
      }
    ]*/
  },
  output: {
    path: __dirname + '/.tmp',
    filename: 'assets/javascript/site.js',
    //filename: 'bundle.js'
  },
};