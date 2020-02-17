const path = require("path");

module.exports = {
  mode: 'development',
  devServer: {
    open: true,
    openPage: "index.html",
    contentBase: path.join(__dirname, "public"),
    watchContentBase: true,
    host: "0.0.0.0",
    port: 3000,
  },
  entry: {index: './src/index.js'},
  output: {
    path: path.join(__dirname, "dist/js"),
    publicPath: "js/",
    filename: '[name].js',
    libraryTarget: 'umd'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: [
              [
                "@babel/preset-env",
                {
                  "useBuiltIns": "usage",
                  "targets": "> 0.25%, not dead",
                  'corejs': 3
                }
              ]
            ],
            plugins: [
              ["@babel/transform-react-jsx", {
                "pragma": "h",
                "pragmaFrag": "Fragment"
              }]
            ]
          }
        }
      }
    ]
  },
  devtool: 'inline-source-map'
};
