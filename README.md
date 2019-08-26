# Hello Fluentd sidecar
Fluentd のサイドカーコンテナをデプロイするサンプルです。

## Requirements
事前に、[fluentd-sidecar-image](https://github.com/shidokamo/fluentd-sidecar-image) をビルドして
ローカルもしくはクラウドレポジトリに登録しておく必要があります。
その後、必要に応じて、イメージのパスを書き換えてください。

## 構成
GKE クラスタ内に以下の構成でデプロイを行います。

```
app1 _____ aggs
app2 __/
```

