function addToNewUrl() {
  // URL取得
  let path = location.pathname;
  let pattern = /^.*\/new.*$/

  // URLが正しければ変更は不要
  if(path.match(pattern)) return;

  // URLを変更
  history.replaceState('', '', `${ path }/new`)
}
window.addEventListener("load", addToNewUrl);
//このファイルは不要だが今後もしrenderでビューを返してリロードするとエラーになるのを解消したい時に役に立つと思って残す