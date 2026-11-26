# mise の設定

`~/.config/mise` は `~/.dotfiles/.config/mise` へのシンボリックリンク。ここを編集すると、そのまま `~/.config/mise` の中身になる。

## 設定ファイルは 2 つに分かれている

| ファイル | git | 置くもの |
|---|---|---|
| `config.toml` | 追跡する | ツール一覧と、どのマシンでも同じ設定 |
| `conf.d/local.toml` | 追跡しない (`.gitignore` の `/.config/mise/conf.d/`) | 勤務先のパスなど、公開リポジトリに載せない設定 |

`conf.d/*.toml` も global config として読まれるので、`paranoid` や `trusted_config_paths` のような global 限定の設定をここに置ける。

`settings.toml` は読まれない (mise 2026.11.4 で確認。`~/.config/mise/settings.toml` を置いても `mise settings get` に出てこない)。設定を足すときは `config.toml` か `conf.d/*.toml` のどちらかにする。

## 優先順位は 環境変数 > config.toml > conf.d

同じキーが複数の場所にあるときは、

1. `MISE_*` 環境変数
2. `config.toml`
3. `conf.d/*.toml` (複数あるときはファイル名の昇順で、後ろのファイルが勝つ)

の順に強い。配列もマージされず、勝った側の値で全部置き換わる。

**`trusted_config_paths` を `config.toml` に書き戻さない。** `conf.d/local.toml` の値が無効になり、信頼していたパスの配下が未 trust に戻って、そこでの mise 呼び出しが全部 not trusted のエラーになる。信頼するパスを足すときは `conf.d/local.toml` の配列に並べる。

## trust の仕組み

`paranoid = true` なので、trust していない `mise.toml` は読まない (`mise.toml` は task や env で任意のコマンドを実行できる)。例外は `conf.d/local.toml` の `trusted_config_paths` 配下だけ。

- 前方一致のみで glob は効かない。`*/mise.toml` のような指定はできないので、repo ごとに列挙せず org のクローン先を 1 本だけ書いている
- worktree は `<repo>/.claude/worktrees/{repo}/{branch}` に作られる。repo の中なので前方一致で拾える。`mise trust` はパス単位の記録なので、worktree を切るたびに未 trust に戻る。それを避けるために `trusted_config_paths` を使っている
- `conf.d/local.toml` は git 管理外なので、新しいマシンでは `script/setup` を走らせても作られない。手で作るまで、信頼するはずのパスの配下で mise 呼び出しが not trusted で落ちる

## MISE_CONFIG_DIR を差し替えて動作確認するとき

`MISE_CONFIG_DIR` を一時ディレクトリに向けると、`.dotfiles/.config/mise/config.toml` が global config ではなくなる。その状態で cwd が `~/.dotfiles` だと、同じファイルが project config として拾われて次の 2 つが起きる。

- `paranoid in non-global config ... is ignored for security reasons` の警告が出て、`paranoid` と `trusted_config_paths` が無視される
- 一時ディレクトリ側で `paranoid = true` にしていると、`.dotfiles/.config/mise/config.toml` 自体が未 trust 扱いになり、`mise` のコマンドが全部エラーで止まる

動作確認するときは cwd を `~/.dotfiles` の外にする。

## 検証系の設定は緩めない

`slsa`、`gpg_verify`、`*_attestations`、`provenance_api_failures_fatal` は意図して全部有効にしている。インストールが検証で止まったときに、これらを `false` にして回避しない。止まった理由を調べる。

`minimum_release_age = "3d"` も同じ。公開から 3 日経っていないバージョンは選ばれない。取り下げられたリリースや、公開後に差し替えられたアーティファクトを踏まないためなので、新しいバージョンを急いで入れたいときでも値を下げない。
