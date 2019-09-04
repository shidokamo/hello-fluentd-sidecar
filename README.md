# Hello Fluentd sidecar
Fluentd のサイドカーコンテナをデプロイするサンプルです。

## Requirements
事前に、以下の２つのイメージをビルドしておく必要があります。

* [fluentd-sidecar-image](https://github.com/shidokamo/fluentd-sidecar-image)
* [testr-logger-image](https://github.com/shidokamo/fluentd-sidecar-image)

ローカルにイメージを保存するか、もしくはクラウドレポジトリに登録しておく必要があります。
gcr.io のコンテナレジストリ以外を使う場合は、イメージのパスを書き換えてください。

## デプロイ
```
make
```

## 動作
* Pod 内に２つのコンテナを起動します。
* logger コンテナは、`/var/log/app.log` へログローテートを行いながらログを出力し続けます。
* sidecar コンテナは、`/var/log/app.log` を監視し、得たログを標準出力へ出力します。

## ログの確認
Fluentd のサイドカーコンテナの最終出力結果は以下のように確認できます。
Pod の名前は、`kubectl get pod` で得たものに置き換えてください。

```
kubectl logs sidecar-example-59cb4fdbc6-6kd4s -c sidecar
```

## クリーンナップ
```
make clean
```
