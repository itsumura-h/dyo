新人にドヤ顔で説明できるか、今風フロントエンド開発ハンズオン(Git/Node.js/ES6/webpack4/Babel7) https://qiita.com/riversun/items/29d5264480dd06c7b9fb


|package|discription|
|---|---|
|dyo|フレームワーク|
|webpack|複数のJSファイルを一つにする|
|webpack-cli||
|webpack-dev-server|開発用サーバー|
|babel-loader|トランスパイル|
|@babel/core|トランスパイル|
|@babel/preset-env|トランスパイル|
|@babel/transform-react-jsx|DyoでJSXを使えるようにする|

---

package.json
```javascript
{
  "name": "dyo", // プロジェクト名
  "version": "0.1.0", // バージョン
  "main": "index.js", // エントリポイントになるJSファイル名
  "license": "MIT", // ライセンス
  "scripts": {
    // 開発用サーバーを起動するコマンド
    "serve": "webpack-dev-server",
    // 開発用にビルドするコマンド
    "dev": "webpack --config webpack.config.js --mode development"
    // 本番用にビルドするコマンド
    "build": "webpack --config webpack.config.js --mode production"
  },
  "devDependencies": {
    "@babel/core": "^7.8.4",
    "@babel/preset-env": "^7.8.4",
    "babel-loader": "^8.0.6",
    "dyo": "^2.0.1",
    "webpack": "^4.41.5",
    "webpack-cli": "^3.3.10",
    "webpack-dev-server": "^3.10.3"
  }
}

```

webpack.config.js
```javascript
// NodeJS標準モジュールのpathをインポート
const path = require("path");

module.exports = {
  // コードの最適化に関する指定
  mode: 'development', // development or production(デフォルト)
  devServer: {
    // 自動的にブラウザを起動する。
    open: true,
    // 自動的にブラウザを起動するときに開くページ
    openPage: "index.html",
    // 静的ファイルのルートディレクトリ
    contentBase: path.join(__dirname, "public"),
    // contentBase 以下にあるファイルに変更があった場合に自動的にブラウザをリロードする機能の設定
    watchContentBase: true,
    host: "0.0.0.0",
    port: 3000,
  },
  //　複数のjsファイルをimportしているファイル
  entry: {index: './src/index.js'},
  output: {
    // 出力するディレクトリ
    path: path.join(__dirname, "dist"),
    // /js以下のルーティングで配信する
    publicPath: "/js/",
    filename: '[name].js',
    // ライブラリ化するときの方式 umd or amd
    libraryTarget: 'umd'
  },
  // ES6をトランスパイルする設定
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
                  // Babel 7.4系で core-js@3 由来エラーが出た場合の対策
                  'corejs': 3
                }
              ]
            ]
          }
        }
      }
    ]
  },
  devtool: 'inline-source-map'
};

```