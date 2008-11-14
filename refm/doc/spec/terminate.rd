= 終了処理

Ruby はスクリプトの終端に達した場合や捕捉していない例外が発生した場
合に終了します(関数 [[m:Kernel.#exit]] や [[m:Kernel.#abort]]
、メインスレッドに対する [[m:Thread.kill]] などは
[[c:SystemExit]] 例外を発生させます)。終了時には以下
の処理が順に実行されます。

  (1) すべてのスレッドを [[m:Thread.kill]] する。
  (1) Ruby の疑似シグナル SIGEXIT のハンドラが登録されていればそれを実
      行する([[m:Kernel.#trap]] を参照)。
  (1) [[ref:d:spec/control#END]] ブロック(END { ... } または関数
      [[m:Kernel.#at_exit]] で指定したブロック)が登録されていれば、
      そのブロックを登録とは逆順に実行する。このブロックの実行中に発生
      した大域脱出はそのブロックの処理を中断するが。スクリプトはまだ終
      了しない。
  (1) [[m:ObjectSpace.define_finalizer]] により、ファイナ
      ライザが登録されていればそれらを実行する。実行順序は不定。
      ファイナライザ実行中に発生した大域脱出はそのファイナライザの処理
      を中断するが、スクリプトはまだ終了しない。
  (1) [[man:exit(3)]] により終了する。
      このとき渡される終了ステータス値は終了方法によります。
      例えば、
//emlist{
      * スクリプトの終端に達した場合は 0
      * [[m:Kernel.#exit]] に渡した引数
      * [[c:SystemExit]] による例外以外は 1
#@until 1.8.0
      * [[c:SystemExit]] を明示的に raise したときは 0
#@end

//}
関数 [[m:Kernel.#exit!]] による終了は、[[man:_exit(2)]]
を実行するだけで、上記の処理はいずれも行われません。
